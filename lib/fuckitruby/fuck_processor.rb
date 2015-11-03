require 'ast'

module FuckItRuby
  class FuckProcessor < AST::Processor
    attr_reader :locations

    def initialize(method_label, from, whole_file, *args)
      @method_label = method_label
      @from = from
      @whole_file = whole_file
      @locations = []
      super *args
    end

    def on_begin(node)
      process_all node
    end

    def handler_missing(node)
      process_all(node.children.select { |c| c.is_a?(AST::Node) })
    end

    def on_def(node)
      if !@whole_file && node.children[0] == @method_label
        @itshappening = true
        node.children[1..-1].each &method(:process)
        @itshappening = false
      elsif @whole_file && node.children[0] == @from
        @locations << [node.location.name.begin_pos, node.location.name.end_pos]
        node.children[1..-1].each &method(:process)
      end
    end

    def on_lvasgn(node)
      if (@whole_file || @itshappening) && node.children[0] == @from
        @locations << [node.location.name.begin_pos, node.location.name.end_pos]
      end
    end

    def mark_local(node)
      if (@whole_file || @itshappening) && node.children[0] == @from
        @locations << [node.location.expression.begin_pos, node.location.expression.end_pos]
      end
      node
    end

    alias_method :on_lvar, :mark_local
    alias_method :on_arg, :mark_local

    def on_send(node)
      if (@whole_file || @itshappening) && node.children[1] == @from #&& node.children[0].nil?
        @locations << [node.location.selector.begin_pos, node.location.selector.end_pos]
      end
    end
  end
end

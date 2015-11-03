require 'binding_of_caller'
require 'parser/current'
require 'hotwater'
require 'colorize'

class NameError
  alias_method :e, :exception

  def exception
    @bindings = binding.callers
    e
  end    

  def message
    error_dialog *fix_for_name
    exec("ruby #{backtrace_locations[0].absolute_path}")
  end

  private

  def method_label
    backtrace_locations[0].base_label.to_sym
  end

  def fix_for_name
    b = @bindings.find { |c| c.eval('self.class') != self.class }
    methods = (b.eval('self.class.private_methods') + b.eval('methods')).uniq
    fix = !b.local_variables.empty? ? closest_name(name, b.local_variables + methods) : closest_name(name, methods)
    [fix, methods]
  end

  def error_dialog(fix, methods)
    puts
    puts  "fix in '#{method_label}': '#{name}' to"
    puts  "  #{fix}".ljust(42) + "[ENTER]".colorize(:green)
    puts  "  other name".ljust(42) + "[type it]".colorize(:yellow) + "[ENTER]".colorize(:green)
    puts  "  fix #{fix} to #{name}".ljust(42) + "R [ENTER]".colorize(:green)
  
    l = gets.chomp
  
    if l.empty?
      rewrite_with_name(backtrace_locations[0].path, method_label, name, fix, methods.include?(name))
    elsif l == 'R'
      rewrite_with_name(backtrace_locations[0].path, method_label, fix, name, methods.include?(fix))
    else
      rewrite_with_name(backtrace_locations[0].path, method_label, name, l, methods.include?(name))
    end
  end

  def closest_name(label, locals)
    locals.map { |l| [Hotwater.levenshtein_distance(l.to_s, label.to_s), l] }.min[1]
  end

  def rewrite_with_name(path, method, from, to, whole_file)
    source = File.read(path)
    ast = Parser::CurrentRuby.parse source
    fuck = FuckItRuby::FuckProcessor.new(method, from, whole_file)
    fuck.process ast
    lines = source.split("\n")
    tokens, lc = [], 0
    fuck.locations.each do |b, e|
      tokens << source[lc..b - 1]
      tokens << to.to_s
      lc = e
    end
    tokens << source[lc..-1]
    File.write path, tokens.join
  end
end

require 'parser/current'
require 'spec_helper'

module FuckItRuby
  describe FuckProcessor do
    it 'finds a name in method' do
      expect_locations "def a; z; end", :z, [[7, 8]], :a, false
    end

    it 'finds names in method' do
      expect_locations "def a; z\n2\n    z; end", :z, [[7, 8], [15, 16]], :a, false
    end

    it 'finds names in file' do
      expect_locations "z =2\nz\n", :z, [[0, 1], [5, 6]], :a, true
    end

    def expect_locations(source, name, locations, method, whole_file)
      a = Parser::CurrentRuby.parse(source + "\n2")
      f = FuckProcessor.new(method, name, whole_file)
      f.process(a)
      expect(f.locations).to eq locations
    end
  end
end

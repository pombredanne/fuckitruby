require 'spec_helper'

describe NameError do
  describe '#closest_name' do 
    it 'finds the most similar name to a group of names' do
      n = NameError.new
      expect(n.send(:closest_name, 'baba', ['ba', 'babla', 'babe', 'java'])).to eq 'babe'
    end
  end
end

require 'Rspec'
require './lib/secret_4'

describe Secret_4 do
  describe '#initialize' do
    it 'is a secret' do
      secret = Secret_4.new("GRRB")
      expect(secret).to be_a(Secret_4)
    end

    it 'has a pattern' do
      secret = Secret_4.new("GRRB")
      expect(secret.pattern).to eq("GRRB")
    end
  end

  describe '#elements' do
    it 'returns correct number of elements' do
      secret = Secret_4.new("GRRB")
      guess = "RGRY"
      expect(secret.elements(guess)).to eq(3)
    end
  end

  describe '#position' do
    it 'returns correct position of elements' do
      secret = Secret_4.new("GRRB")
      guess = "GRRB"
      expect(secret.position(guess)).to eq(4)
    end
  end

end

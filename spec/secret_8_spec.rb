require "Rspec"
require "./lib/secret_8"

describe Secret_8 do
    describe '#initialize' do
      it 'is a secret' do
        secret = Secret_8.new("GRRBYOMM")
        expect(secret).to be_a(Secret_8)
      end
  
      it 'has a pattern' do
        secret = Secret_8.new("GRRBYOMM")
        expect(secret.pattern).to eq("GRRBYOMM")
      end
    end
  
    describe '#elements' do
      it 'returns correct number of elements' do
        secret = Secret_8.new("GRRBOOMM")
        guess = "RGRYOOOO"
        expect(secret.elements(guess)).to eq(5)
      end
    end
  
    describe '#position' do
      it 'returns correct position of elements' do
        secret = Secret_8.new("GRRBYOMM")
        guess = "GRRBYOMM"
        expect(secret.position(guess)).to eq(8)
      end
    end
  
  end
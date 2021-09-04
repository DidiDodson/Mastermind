require "Rspec"
require "./lib/secret_6"

describe Secret_6 do
    describe '#initialize' do
      it 'is a secret' do
        secret = Secret_6.new("GRRBYO")
        expect(secret).to be_a(Secret_6)
      end
  
      it 'has a pattern' do
        secret = Secret_6.new("GRRBYO")
        expect(secret.pattern).to eq("GRRBYO")
      end
    end
  
    describe '#elements' do
      it 'returns correct number of elements' do
        secret = Secret_6.new("GRRBOO")
        guess = "RGRYOO"
        expect(secret.elements(guess)).to eq(5)
      end
    end
  
    describe '#position' do
      it 'returns correct position of elements' do
        secret = Secret_6.new("GRRBYO")
        guess = "GRRBYO"
        expect(secret.position(guess)).to eq(6)
      end
    end
  
  end
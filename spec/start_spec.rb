require "Rspec"
require "./lib/start"

describe "Start" do
    describe "#initialize" do
        it "is an instance of Start" do

            start = Start.new

            expect(start).to be_a Start
        end

        it "contains a secret" do

            start = Start.new

            expect(start.randomize).to be_a String
            expect(start.randomize.length).to eq(4)
        end
    end

    describe '#time_format' do
    it 'gives time properly' do

      start = Start.new

      expect(start.time_format(123456.0)). to eq("2057 minutes, 36 seconds.")
    end

    describe "#randomize" do
      it 'gives four random letters' do
        start = Start.new

        expect(start.randomize).to be_a String
        expect(start.randomize.length).to eq(4)
      end
    end
  end
end

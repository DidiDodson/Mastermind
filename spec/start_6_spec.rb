require "Rspec"
require "./lib/start_6"

describe Start_6 do
    describe "#initialize" do
        it "is an instance of Start" do

            start = Start_6.new

            expect(start).to be_a Start_6
        end

        it "contains a secret" do

            start = Start_6.new

            expect(start.randomize).to be_a String
            expect(start.randomize.length).to eq(6)
        end
    end

    describe '#time_format' do
    it 'gives time properly' do

      start = Start_6.new

      expect(start.time_format(123456.0)). to eq("2057 minutes, 36 seconds.")
    end

    describe "#randomize" do
      it 'gives four random letters' do
        start = Start_6.new

        expect(start.randomize).to be_a String
        expect(start.randomize.length).to eq(6)
      end
    end

    describe "#start_message" do
      it "prints the welcome message" do
        start = Start_6.new
       
        expect(start.start_message).to eq "I have generated a intermediate sequence with six elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, and (o)range. \nUse (q)uit at any time to end the game. \nWhat's your guess?"
      end
    end

    describe "#goodbye_message" do
      it "says goodbye" do
        start = Start_6.new

        expect(start.goodbye_message).to eq "Goodbye."
      end
    end
  end
end
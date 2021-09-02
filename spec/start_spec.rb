require "Rspec"
require "./lib/start"

describe "Start" do
    describe "#initialize" do
        it "is an instance of Start" do
            secret = Secret.new("RBBG")

            start = Start.new(secret)

            expect(start).to be_a Start
        end

        it "contains a secret" do
            secret = Secret.new("RBBG")

            start = Start.new(secret)

            expect(start.secret).to eq secret
            expect(start.secret.pattern).to eq "RBBG"
        end
    end

    describe '#time_format' do
    it 'gives time properly' do
      secret = Secret.new("RBBG")

      start = Start.new(secret)

      expect(start.time_format(123456.0)). to eq("2057 minutes, 36 seconds.")
    end
  end
end

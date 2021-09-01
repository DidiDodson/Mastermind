class Start
    attr_reader :secret,
                :guess

    def initialize(secret)
        @secret = secret
        @guess = 0
    end

    def instructions
        puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow."
        puts "In order to submit a guess enter in a string of four letters in all caps."
        puts "For example: 'RGBY' \n\n"
        puts "In order to quit the game enter 'p'"
        puts "Would you like to (p)lay, read the (i)nstructions. or (q)uit?"
    end
end
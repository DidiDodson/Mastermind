class Start
    attr_reader :secret,
                :guess_num

    def initialize(secret)
        @secret = secret
        @guess_num = 0
    end

    def instructions
        puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow."
        puts "In order to submit a guess enter in a string of four letters."
        puts "For example: 'RGBY' \n\n"
        puts "In order to quit the game enter 'p'"
        puts "Would you like to (p)lay, read the (i)nstructions. or (q)uit?"
    end

    def start_game
        puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow."
        puts "Use (q)uit at any time to end the game."
        puts "What's your guess?"

        proceed = true

        start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

        while proceed == true do
            guess = gets.chomp
            guess.upcase!

            if guess == secret.pattern
                end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
                play_time = end_time - start_time
                puts "Congratulations! You guessed the sequence '#{secret.pattern}' in #{guess_num} guesses over #{time_format(play_time)}"
                puts "Do you want to (p)lay again or (q)uit?"

                response = gets.chomp

                if response == "p" || response == "play"
                    puts "Starting a new game!"
                elsif response == "q" || response == "quit"
                    proceed = false
                    puts "Goodbye."
                else
                    proceed = false
                    puts "Goodbye"
                end
            elsif guess == "q" || guess == "quit"
                puts "Goodbye"
                proceed = false
            elsif guess == "c" || guess == "cheat"
                puts secret.patern
                puts "Nice try! Try again."
                proceed = false
            elsif guess.length < 4
                puts "Guess is too short. Must be 4 letters; guess again."
            elsif guess.length > 4
                puts "Guess is too long. Must be 4 letters; guess again."
            elsif secret.position(guess) < 4
                @guess_num += 1
                puts "'#{guess}' has #{secret.elements(guess)} of the correct elements with #{secret.position(guess)} in the correct positions"
                puts "You've taken #{guess_num} guess"
            else
                puts "Please enter a valid guess."
            end
        end
    end

    def time_format(seconds)
      minutes = seconds / 60
      seconds_2 = (minutes - minutes.floor) * 60
      return "#{minutes.floor} minutes, #{seconds_2.round} seconds."
    end
end

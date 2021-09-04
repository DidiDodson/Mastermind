class Start_4
    attr_reader :guess_num

    def initialize
        @guess_num = 0
    end

    def instructions
        "The game is played by guessing a sequence of colors that I have created! \nThere are three levels of difficulty: beginner, intermediate, and advanced. \nThe beginner difficulty has four elements in the sequence with four possible colors. \nThe intermediate difficulty has six elements with five possible colors. \nThe advanced difficulty has eight elements with six possible colors. \nAn example guess for the intermediate difficulty would look like 'BGGYO'. \nWould you like to (p)lay, read the (i)nstructions. or (q)uit?"
    end

    def start_game
        puts start_message

        proceed = true

        start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

        secret = Secret_4.new(randomize)

        while proceed == true do
            guess = gets.chomp
            guess.upcase!

            if guess == secret.pattern
                end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
                play_time = end_time - start_time
                
                puts win_message(secret, guess_num, play_time)
                
                secret = Secret_4.new(randomize)

                response = gets.chomp

                if response == "p" || response == "play"
                    puts "Starting a new game!"
                    puts start_message
                elsif response == "q" || response == "quit"
                    proceed = false
                    puts goodbye_message
                else
                    proceed = false
                    puts goodbye_message
                end
            elsif guess == "Q" || guess == "QUIT"
                puts goodbye_message
                proceed = false
            elsif guess == "C" || guess == "CHEAT"
                puts secret.pattern
            elsif guess.length < 4
                puts wrong_length(guess)
            elsif guess.length > 4
                puts wrong_length(guess)
            elsif secret.position(guess) < 4
                @guess_num += 1
                puts turn_message(secret, guess, guess_num)
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

    def randomize
      letters = ["R", "G", "B", "Y"]
      random_secret = ""

      4.times do
        random_secret += letters.sample
      end
      return random_secret
    end

    def start_message
        "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. \nUse (q)uit at any time to end the game. \nWhat's your guess?"
    end

    def goodbye_message
        "Goodbye."
    end

    def wrong_length(guess_length)
        if guess_length.length < 4
            "Guess is too short. Guess again."
        elsif guess_length.length > 4
            "Guess is too long. Guess again"
        else
            "Error: you shouldn't be here"
        end
    end

    def turn_message(turn_secret, wrong_guess, guess_turn)
        "'#{wrong_guess}' has #{turn_secret.elements(wrong_guess)} of the correct elements with #{turn_secret.position(wrong_guess)} in the correct positions. \nYou've taken #{guess_turn} guess."
    end

    def win_message(win_secret, win_turn, win_time)
        "Congratulations! You guessed the sequence '#{win_secret.pattern}' in #{win_turn} guesses over #{time_format(win_time)} \nDo you want to (p)lay again or (q)uit?"
    end

    def welcome_message
        "Welcome to MASTERMIND \n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit? \n"
    end

    def difficulty_message
        "What difficulty would you like to play? (b)eginner, (i)ntermediate, or (a)dvanced?"
    end
end

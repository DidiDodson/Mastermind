class Start_8
    attr_reader :guess_num

    def initialize
        @guess_num = 0
    end

    def instructions
        puts "I have generated a beginner sequence with six elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, and (o)range."
        puts "In order to submit a guess enter in a string of six letters."
        puts "For example: 'RGBYOR' \n\n"
        puts "In order to quit the game enter 'p'"
        puts "Would you like to (p)lay, read the (i)nstructions. or (q)uit?"
    end

    def start_game
        puts start_message

        proceed = true

        start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

        secret = Secret_8.new(randomize)

        while proceed == true do
            guess = gets.chomp
            guess.upcase!

            if guess == secret.pattern
                end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
                play_time = end_time - start_time

                puts "Congratulations! You've guessed the sequence! What's your name?"
                name = gets.chomp
                add_winner(name, secret.pattern, guess_num, play_time)

                puts average_message(name, secret, guess_num, play_time, average_time, average_turns)

                leader_board

                secret = Secret_8.new(randomize)

                response = gets.chomp
                @guess_num = 0
                response.upcase!

                if response == "P" || response == "PLAY"
                    puts "Starting a new game!"
                    puts start_message
                elsif response == "Q" || response == "QUIT"
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
            elsif guess.length < 8
                puts wrong_length(guess)
            elsif guess.length > 8
                puts wrong_length(guess)
            elsif secret.position(guess) < 8
                @guess_num += 1
                puts turn_message(secret, guess, @guess_num)
            else
                puts "Please enter a valid guess."
            end
        end
    end

    def time_format(seconds)
      minutes = seconds / 60
      seconds_2 = (minutes - minutes.floor) * 60
      return "#{minutes.floor} minutes, #{seconds_2.round} seconds"
    end

    def randomize
      letters = ["R", "G", "B", "Y", "O", "M"]
      random_secret = ""

      8.times do
        random_secret += letters.sample
      end
      return random_secret
    end

    def start_message
        "I have generated an advanced sequence with eight elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, (o)range, and (m)agenta. \nUse (q)uit at any time to end the game. \nWhat's your guess?"
    end

    def goodbye_message
        "Goodbye."
    end

    def wrong_length(guess_length)
        if guess_length.length < 8
            "Guess is too short. Guess again."
        elsif guess_length.length > 8
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

    def add_winner(name, pattern, guess_num, time)
      CSV.open("player.txt", "a") do |csv|
        csv << [name, pattern, guess_num.to_s, time.to_s]
      end
    end

    def csv_time(seconds)
      minutes = seconds / 60
      seconds_2 = (minutes - minutes.floor) * 60
      return "#{minutes.floor}m#{seconds_2.round}s"
    end

    def average_time
      table = CSV.parse(File.read("player.txt"), headers: true)
      table.by_col!
      times = table['time']
      counter = 0.0
      sum = 0.0

      av_times = times.map do |time|
        time.to_f
      end

      av_times.each do |av_time|
        sum += av_time
        counter += 1.0
      end
    sum / counter
    end

    def average_turns
      table = CSV.parse(File.read("player.txt"), headers:true)
      table.by_col!
      turns = table['guess_num']
      counter = 0
      sum = 0

      av_turns = turns.map do |turn|

        turn.to_i
      end

      av_turns.each do |av_turn|
        sum += av_turn
        counter += 1
      end
    sum / counter
    end

    def average_message(win_name, win_secret, win_turn, win_time, win_average_time, win_average_turn)
      "#{win_name}, you guessed the sequence '#{win_secret.pattern}' in #{win_turn} guesses over #{time_format(win_time)}. That's #{time_format(player_time(win_time, win_average_time))} faster and #{player_turns(win_turn, win_average_turn)} guesses fewer than the average."
    end

    def player_time(win_time, win_average_time)
      win_time - win_average_time
    end

    def player_turns(win_turn, win_average_turn)
      win_turn - win_average_turn
    end

    def convert_to_array
      array = []
      array = CSV.read("player.txt")
      array.shift

      array.sort_by do |turn|
        turn[2].to_i
      end
    end

    def leader_board
      counter = 0

      puts "=== TOP 10 ==="
      sorted_array = convert_to_array
      10.times do
        puts "#{counter + 1}. #{sorted_array[counter][0]} solved '#{sorted_array[counter][1]}' in #{sorted_array[counter][2]} guesses over #{csv_time(sorted_array[counter][3].to_f)}"
        counter += 1
      end
    end
end

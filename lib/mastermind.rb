require "./secret_4"
require "./secret_6"
require "./start_4"
require "./start_6"

start_4 = Start_4.new

puts start_4.welcome_message

proceed = true

while proceed == true do
    response = gets.chomp

    if response == "p" || response == "play"
        # start_4.start_game
        # proceed = false
        puts start_4.difficulty_message

        difficulty = gets.chomp
        difficulty.upcase!

        if difficulty == "B" || difficulty == "BEGINNER"
            start_4.start_game
            proceed = false
        elsif difficulty == "I" || difficulty == "INTERMEDIATE"
            start_6 = Start_6.new
            start_6.start_game
            proceed = false
        # elsif difficulty == "A" || difficulty == "ADVANCED"
        #     start_8 = Start_8.new
        #     start_8.start_game
        #     proceed = false
        else
            puts "Please enter a valid choice"
        end
    elsif response == "i" || response =="instructions"
        puts start_4.instructions
    elsif response == "q" || response == "quit"
        puts start.goodbye_message
        proceed = false
    else
        puts "Please enter a valid choice"
    end
end

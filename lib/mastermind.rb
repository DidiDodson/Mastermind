require "./secret_4"
require "./start_4"

start = Start_4.new

puts start.welcome_message

proceed = true

while proceed == true do
    response = gets.chomp

    if response == "p" || response == "play"
        start.start_game
        proceed = false
    elsif response == "i" || response =="instructions"
        start.instructions
    elsif response == "q" || response == "quit"
        puts start.goodbye_message
        proceed = false
    else
        puts "Please enter a valid choice"
    end
end

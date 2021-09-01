require "./secret"
require "./start"

#start = Start.new("RGGB")

puts "Welcome to MASTERMIND \n\n"
puts "Would you like to (p)lay, read the (i)nstructions. or (q)uit? \n"

proceed = true

while proceed == true do
    response = gets.chomp

    if response == "p" || response == "play"
        #start.start_game
        proceed = false
    elsif response == "i" || response =="instructions"
        #start.instructions
    elsif response == "q" || response == "quit"
        puts "Goodbye"
        proceed = false
    else
        puts "Please enter a valid choice"
    end
end

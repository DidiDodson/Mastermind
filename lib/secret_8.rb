class Secret_8
    attr_reader :pattern
  
    def initialize(pattern)
      @pattern = pattern
    end
  
    def elements(guess)
      secret_array = pattern.split("")
      guess_array = guess.split("")
      correct_elements = 0
      8.times do
        guess_array.each do |letter|
          if secret_array.include?(letter)
            correct_elements += 1
          end
        end
      return correct_elements
      end
    end
  
    def position(guess)
      secret_array = pattern.split("")
      guess_array = guess.split("")
      correct_position = 0
      index = 0
      8.times do
        if guess_array[index] == secret_array[index]
          correct_position += 1
        end
        index += 1
      end
    return correct_position
    end
end
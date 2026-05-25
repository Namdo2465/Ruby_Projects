class Hangman
    MAX_WRONG_GUESSES = 6
    DICTIONARY_FILE = "words.txt"
  
    def initialize
      @secret_word = choose_secret_word
      @correct_guesses = []
      @wrong_guesses = []
      @remaining_guesses = MAX_WRONG_GUESSES
    end
  
    def choose_secret_word
      words = File.readlines(DICTIONARY_FILE, chomp: true)
  
      valid_words = words.select do |word|
        word.length >= 5 && word.length <= 12
      end
  
      valid_words.sample.downcase
    end
  
    def play
      puts "Welcome to Hangman!"
  
      until won? || lost?
        display_game_state
        guess = ask_for_guess
        process_guess(guess)
      end
  
      display_game_state
  
      if won?
        puts "You win! The word was #{@secret_word}."
      else
        puts "You lose! The word was #{@secret_word}."
      end
    end
  
    def display_game_state
      puts
      puts "Word: #{display_word}"
      puts "Incorrect guesses: #{@wrong_guesses.join(', ')}"
      puts "Remaining guesses: #{@remaining_guesses}"
      puts
    end
  
    def display_word
      @secret_word.chars.map do |letter|
        if @correct_guesses.include?(letter)
          letter
        else
          "_"
        end
      end.join(" ")
    end
  
    def ask_for_guess
      loop do
        print "Guess a letter: "
        guess = gets.chomp.downcase
  
        if guess.length != 1 || guess.match?(/[^a-z]/)
          puts "Please enter one letter."
        elsif already_guessed?(guess)
          puts "You already guessed '#{guess}'. Try another letter."
        else
          return guess
        end
      end
    end
  
    def already_guessed?(guess)
      @correct_guesses.include?(guess) || @wrong_guesses.include?(guess)
    end
  
    def process_guess(guess)
      if @secret_word.include?(guess)
        puts "Correct!"
        @correct_guesses << guess
      else
        puts "Incorrect!"
        @wrong_guesses << guess
        @remaining_guesses -= 1
      end
    end
  
    def won?
      @secret_word.chars.all? do |letter|
        @correct_guesses.include?(letter)
      end
    end
  
    def lost?
      @remaining_guesses <= 0
    end
  end
  
game = Hangman.new
game.play
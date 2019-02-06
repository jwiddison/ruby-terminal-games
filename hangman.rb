#!/usr/bin/env ruby

def play
  system "clear" or system "cls"
  puts "##################"
  puts '#### HANG MAN ####'
  puts "##################"

  wrong_letters = []
  correct_letters = []

  puts "\nWhat word do you want people to guess?"
  print '#: '
  word = gets.chomp.upcase
  prompt = word.split('').map { |x| "_ " }.join('')

  while wrong_letters.length < 6
    system "clear" or system "cls"

    if !wrong_letters.empty?
      puts "\nIncorrect letters you've guessed:"
      puts wrong_letters.join(' ') + "\n"
    end

    puts "\n#{prompt}\n"

    puts "\nGuess a letter:"
    print '#: '
    guess = gets.chomp

    if guess.length == 1
      if word.include?(guess.upcase)
        correct_letters << guess.upcase
        prompt = word.split('').map do |letter|
          correct_letters.include?(letter) ? "#{letter} " : "_ "
        end.join('')
      else
        if wrong_letters.include?(guess.upcase)
          puts "\n\nYou've already guessed #{guess.upcase}!!"
          sleep(1)
        else
          wrong_letters << guess.upcase
          puts "Sorry, no #{guess.upcase}"
        end
      end

      if prompt.gsub('_', '').gsub(' ', '') == word
        puts prompt
        puts 'YOU DID IT!!!'
        break
      end
    else
      puts "\n\nOnly guess one letter at a time!!"
      sleep(1)
    end
  end

  # You didn't win
  puts "\n\nBetter luck next time!!\n\n"
  puts "   _________   "
  puts "  |         |  "
  puts "  |         0  "
  puts "  |        /|\\"
  puts "  |        / \\"
  puts "  |            "
  puts "  |            "
  puts "------         "
end

play()

#!/usr/bin/env ruby

def play
  system "clear"
  puts "#################"
  puts '#### HANGMAN ####'
  puts "#################"

  puts "\nWhat word do you want people to guess?"
  print '#: '
  word = gets.chomp.upcase
  prompt = word.split('').map { |x| "_ " }.join('')

  wrong_letters = []
  correct_letters = []
  won = false

  while wrong_letters.length < 6
    system "clear"

    if !wrong_letters.empty?
      puts "\nIncorrect letters you've guessed:"
      puts wrong_letters.join(' ') + "\n"
    end

    puts "\n#{prompt}\n"

    puts "\nGuess a letter:"
    print '#: '
    guess = gets.chomp

    if guess.length != 1
      puts "\n\nOnly guess one letter at a time!!"
      sleep(0.75)
      next
    end

    if wrong_letters.include?(guess.upcase) || correct_letters.include?(guess.upcase)
      puts "\n\nYou've already guessed #{guess.upcase}!!"
      sleep(0.75)
      next
    end

    if word.include?(guess.upcase)
      correct_letters << guess.upcase
      prompt = word.split('').map do |letter|
        correct_letters.include?(letter) ? "#{letter} " : "_ "
      end.join('')
    else
      wrong_letters << guess.upcase
      puts "Sorry, no #{guess.upcase}"
    end

    if prompt.gsub('_', '').gsub(' ', '') == word
      puts prompt
      puts 'YOU DID IT!!!'
      won = true
      break
    end
  end

  if !won
    puts "\n\nBetter luck next time!!\n\n"
    puts "   _________   "
    puts "  |         |  "
    puts "  |         0  "
    puts "  |        /|\\"
    puts "  |        / \\"
    puts "  |            "
    puts "  |            "
    puts "------         "
    puts "\nBTW, the word was #{word}"
  end
end

play()

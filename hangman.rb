#!/usr/bin/env ruby

def play
  puts "\n"
  puts '##################'
  puts '#### HANG MAN ####'
  puts '##################'
  puts "\n"
  puts "What word should we guess?"
  word = gets.chomp.upcase
  system "clear" or system "cls"
  prompt = word.split('').map { |x| "_ " }.join('')
  wrong_letters = []
  correct_letters = []

  while wrong_letters.length < 6
    puts "\n#{prompt}\n"
    unless wrong_letters.empty?
      puts 'Incorrect letters you\'ve guessed:'
      puts wrong_letters.join(' ')
    end

    puts "\nGuess a letter:"
    print '#: '
    guess = gets.chomp

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
      break
    end
  end
end

play()

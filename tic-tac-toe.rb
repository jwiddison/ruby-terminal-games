#!/usr/bin/env ruby

def play
  system "clear"
  puts '''
  ###################
  ### TIC TAC TOE ###
  ###################

  A simple tic-tac-toe game played from the command line implemented in Ruby

  The numbered moves map to the board like this:

  [1][2][3]
  [4][5][6]
  [7][8][9]
  '''
  sleep(4)
  system "clear"

  board = [
    [' ',' ',' '],
    [' ',' ',' '],
    [' ',' ',' ']
  ]

  options = {
    1 => '1: top-left',
    2 => '2: top-center',
    3 => '3: top-right',
    4 => '4: middle-left',
    5 => '5: middle-center',
    6 => '6: middle-right',
    7 => '7: bottom-left',
    8 => '8: bottom-center',
    9 => '9: bottom-right'
  }

  turn = 1

  while turn < 10 do
    player = turn.odd? ? 'x' : 'o'
    move = ''

    loop do
      print_board(board)
      puts "#{player.upcase}'s turn.  Enter the number for square you want to take:\n\n"
      options.each { |k, v| puts "#{v}" }
      print "\n#: "
      move = gets.chomp
      break if options.keys.include?(move.to_i)
      puts "\n\nPlease choose a valid square"
      sleep(0.75)
      system "clear"
    end

    row, column = get_coordinate_of_move(move)
    board[row][column] = player
    options.delete(move.to_i)

    game_over, winner = check_for_winner(board, player)

    if game_over
      puts "\n#{winner.upcase} WINS!!!!\n"
      print_board(board)
      turn = 10
    else
      system "clear"
      turn += 1
    end
  end
end

def print_board(board)
  puts ""
  board.each do |row|
    puts row.reduce("") { |string, column| string << "[#{column}]" }
  end
  puts ""
end

def get_coordinate_of_move(move)
  row = (move.to_i - 1) / 3
  column = (move.to_i - 1) % 3
  [row, column]
end

def check_for_winner(board, player)
  board_string = board
    .flatten
    .map { |char| char == player ? char : ' ' }
    .reduce('', :+)

  # Check all horizontal
  return [true, player] if board_string.scan(/.{3}/).include?(player * 3)
  # Check all vertical
  return [true, player] if board_string.match?(/#{player}.{2}#{player}.{2}#{player}/)
  # Check diagonal
  return [true, player] if board_string.match?("#{player}.{3}#{player}.{3}#{player}")
  return [true, player] if board_string.match?(".{2}#{player}.#{player}.#{player}.{2}")

  # No one has won
  return [false, '']
end

play()

#!/usr/bin/env ruby

=begin

  A simple tic-tac-toe game played from the command line implemented in Ruby

  The numbered moves map to the board like this:

  [1][2][3]
  [4][5][6]
  [7][8][9]

=end

def main
  puts "\n\n### TIC TAC TOE ###\n\n"

  board = [
    [' ',' ',' '],
    [' ',' ',' '],
    [' ',' ',' ']
  ]

  print_board(board)

  turn = 1

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

  while turn < 10 do
    player = turn.odd? ? 'x' : 'o'
    puts "\n#{player.upcase}'s turn.  Enter the number for the move you want to make:"
    options.each { |k, v| puts "#{v}" }
    move = gets.chomp

    row, column = get_coordinate_of_move(move)
    board[row][column] = player

    print_board(board)
    options.delete(move.to_i)

    game_over, winner = check_for_winner(board, move, player)

    if game_over
      puts "\n#{winner.upcase} WINS!!!!\n"
      turn = 10
    else
      turn += 1
    end
  end
end

def print_board(board)
  board.each do |row|
    puts row.reduce("") { |string, column| string << "[#{column}]" }
  end
end

def get_coordinate_of_move(move)
  row = (move.to_i - 1) / 3
  column = (move.to_i - 1) % 3
  [row, column]
end

def check_for_winner(board, move, player)
  board_string = board
    .flatten
    .map { |char| char == 'x' ? char : ' ' }
    .reduce("", :+)

  # Check all horizontal
  return [true, player] if board_string.include?(player * 3)
  # Check all vertical
  return [true, player] if board_string.include?("#{player}  #{player}  #{player}")
  # Check diagonal
  return [true, player] if board_string.include?("#{player}   #{player}   #{player}")
  return [true, player] if board_string.include?("  #{player} #{player} #{player}  ")

  # No one has won
  return [false, '']
end

main()

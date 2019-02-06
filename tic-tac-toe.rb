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

    row = (move.to_i - 1) / 3
    column = (move.to_i - 1) % 3
    board[row][column] = player

    print_board(board)
    options.delete(move.to_i)

    check_for_winner(board)
    turn += 1
  end
end

def print_board(board)
  board.each do |row|
    puts row.reduce("") { |string, column| string << "[#{column}]" }
  end
end

def check_for_winner(board)
end

main()

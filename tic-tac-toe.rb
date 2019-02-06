row1 = '[ ][ ][ ]'
row2 = '[ ][ ][ ]'
row3 = '[ ][ ][ ]'

string_board = "#{row1}\n#{row2}\n#{row3}"

puts "\n\n### TIC TAC TOE ###\n\n"
puts string_board
puts "\n>> Made for Young Men's <<\n\n"

board = [
  [[],[],[]],
  [[],[],[]],
  [[],[],[]]
]

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

=begin

  The numbered moves map to the board like this:

  [1][2][3]
  [4][5][6]
  [7][8][9]

=end

while turn < 10 do
  # puts "turn: #{turn}"
  puts "#{turn.odd? ? 'X' : '0'}'s turn.  Enter the number of which move you want to make:"
  options.each do |key, value|
    puts "#{value}"
  end
  move = gets.chomp

  # row =
  #   case move
  #   when include?('top')
  #     0
  #   when include?('middle')
  #     1
  #   when include?('bottom')
  #     2
  #   end
  #
  # column =
  #   case move
  #   when include?('left')
  #     0
  #   when include?('center')
  #     1
  #   when include?('bottom')
  #     2
  #   end

  # puts "row: #{row} column: #{column}"

  turn += 1
end

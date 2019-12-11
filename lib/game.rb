class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
  @board = board
  @player_1 = player_1
  @player_2 = player_2
end

def current_player
  if @board.turn_count.even?
    player_1
  else
    player_2
  end
end

def won?
  WIN_COMBINATIONS.any? do |combo|
    if @board.taken?(combo[0]) && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
      return combo
    end
  end
end

def draw?
  @board.full? && !won?
end

def over?
  @board.full? || draw? || won?
end

  def winner
    if @board.cells[won?[0]] == "X" || @board.cells[won?[0]] == "O"
      @board.cells[won?[0]]
    end
  end

  def turn
    puts "Please enter 1-9:"
    # if board.valid_move?(current_player.move(board))
    if board.valid_move?(current_player.move(board))
      board.update(current_player.move(board), current_player)

    else
      puts "Please try again."

    end

  end

#   def turn
#    puts "Please enter 1-9:"
#    user_input = gets.strip
#    index = input_to_index(user_input)
#    if valid_move?(board, index)
#       move(board, index, current_player(board))
#       turn(board)
#    end
#    display_board(board)
# end

  # def turn
  #   puts "Player 1, Please enter 1-9:"
  #   # input = gets.strip
  #   player_1.gets(input)
  #   # gets.strip
  #   # index = input_to_index(gets)
  #   if @board.valid_move?(index)
  #     player_1.move(index, player = current_player)
  #     board.display
  #   else
  #     turn
  #   end
  # end

end

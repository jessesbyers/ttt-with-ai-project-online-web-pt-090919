class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    index = input.to_i - 1
    cells[index]
  end

  def full?
    @cells.all? {|pos| pos != " "}
  end

  def turn_count
    cells.count("X") + cells.count("O")
  end

  def taken?(index)
      if cells[index.to_i - 1] == "" || cells[index.to_i - 1] == " " || cells[index.to_i - 1] == nil
        return false
      else
        return true
      end
  end

  def valid_move?(index)
    (index.to_i-1).between?(0,8) && !taken?(index)
  end

  def update(index, player)
    @cells[index.to_i-1] = player.token
  end
end

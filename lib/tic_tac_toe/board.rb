module TicTacToe
  class Board
    attr_reader :grid
    #if no input given ,creates an empty hash for grid
    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid) # default value
      # set_default_grid

    end

    def get_cell(x, y)
      grid[y][x]
    end

    def set_cell(x, y, value)
      get_cell(x, y).value = value
    end

    def game_over
      return :winner if winner?
      return :draw if draw?
      false
    end

    def draw?
      grid.flatten.map {  |cell| cell.value }.none_empty?
      # #flatten turns the grid to a 1d array,
      # #map creates a new Array
      #the block then maps the values to the new Array
      # checks if the every element of the new Array is not empty
    end

    def formatted_grid
      i = 0
      grid.each do |row|
        print row.map { |cell| cell.value }.join(" | ")
        print "\n----------\n" if i < 2
        i += 1
      end

    end

    def set_default_grid
      set_cell(0, 0, "7")
      set_cell(1, 0, "8")
      set_cell(2, 0, "9")
      set_cell(0, 1, "4")
      set_cell(1, 1, "5")
      set_cell(2, 1, "6")
      set_cell(0, 2, "1")
      set_cell(1, 2, "2")
      set_cell(2, 2, "3")
    end

    private

    def default_grid
      Array.new(3) { Array.new(3) { Cell.new } }

    end

    def winner?
      winning_positions.each do |winning_position|
        next if winning_position_values(winning_position).all_empty?
        return true if winning_position_values(winning_position).all_same?
      end
      false
    end

    def winning_position_values(winning_position)
      winning_position.map { |cell| cell.value }
    end

    def winning_positions
      grid + #rows
      grid.transpose + #columns
      # a = [[1,2], [3,4], [5,6]]
      # a.transpose   #=> [[1, 3, 5], [2, 4, 6]]
      diagonals # two diagonals

      # EXPLANATION
      # GRID RETURNS THE GRID, GRID.TRANSPOSE RETURNS THE ARRAY SEPERATED TO columns
      # DIAGONALS HAS THE HARD CODED ARRAY. WHEN ADDED TOGETHER THEY REMAIN
      # A 2D ARRAY WITH EACH HAVING THE CODES REQUIRED TO SATISFY A WIN
    end

    def diagonals
      [
        [get_cell(0, 0), get_cell(1, 1), get_cell(2, 2)],
        [get_cell(0, 2), get_cell(1, 1), get_cell(2, 0)]
      ]

      # [
      # =>  [(0,0), (1,0), (2,0)]
      # => [(0,1), (1,1), (2,1)]
      # => [(0,2), (2,1), (2,2)]
      #]
    end

  end
end

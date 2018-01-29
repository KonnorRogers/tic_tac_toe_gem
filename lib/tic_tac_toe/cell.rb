# lib/tic_tac_toe/cell.rb
module TicTacToe
  class Cell
    attr_accessor :value

    #if no value given, automatically set to ""
    def initialize(value = "")
      @value = value
    end
  end
end

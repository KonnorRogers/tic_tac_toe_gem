module TicTacToe
  class Game
    attr_reader :players, :board, :current_player, :other_player

    def initialize(players = [], board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def swap_players
      @current_player, @other_player = @other_player, @current_player
    end

    def solicit_move
      "#{current_player.name}: Enter a number from 1-9 to make your move"
    end

    def get_move(human_move = gets.chomp)
      if (sanitize_input(human_move) != false)
        return sanitize_input(human_move)
      else
        get_move
      end
    end

    def sanitize_input(input)
      if !((1..9).include?(input.to_i))
        puts "Improper input, please enter a number between 1-9"
        return false
      end

      first = human_move_to_coordinate(input)[0]
      second = human_move_to_coordinate(input)[1]

      cell_value = board.get_cell(first, second).value
      # puts cell_values

      if cell_value == "X" || cell_value == "Y"
        puts "Coordinate already taken"
        return false
      else
        human_move_to_coordinate(input)
      end
    end


    def game_over_message
      return "#{current_player.name} won!" if board.game_over == :winner
      return "The game ended in a tie!" if board.game_over == :draw
    end

    def play
      puts "#{current_player.name} has been randomly selected as the first player"
      while true
        board.formatted_grid
        puts ""
        puts solicit_move
        x, y = get_move
        board.set_cell(x, y, current_player.color)
        if board.game_over
          puts game_over_message
          board.formatted_grid
          return
        else
          swap_players
        end
      end
    end

    private

    def human_move_to_coordinate(human_move)
      mapping = {
        "7" => [0, 0],
        "8" => [1, 0],
        "9" => [2, 0],
        "4" => [0, 1],
        "5" => [1, 1],
        "6" => [2, 1],
        "1" => [0, 2],
        "2" => [1, 2],
        "3" => [2, 2]
      }
      mapping[human_move]
      #returns a coordinate to be used by Grid::set_cell(x,y)
    end
  end
end

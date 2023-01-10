# frozen_string_literal: true

module GameHelper
  def reconstruct_board(game)
    # Create a 2-dimensional array of 0's
    board = Array.new(game.height) { Array.new(game.width, 0) }

    # Put 1's where the bombs are
    game.config.each { |pair| board[pair.first][pair.last] = 1 }

    board
  end
end

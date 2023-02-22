# require "practice-for-ch-ruby-class-inheritance-long-practice-main/chess_game/piece.rb"
# require "practice-for-ch-ruby-class-inheritance-long-practice-main/chess_game/Stepable.rb"
require_relative "Stepable.rb"
require_relative "Piece.rb"
require "byebug"

class Knight < Piece
    include Stepable

    def initialize(color, board, pos)
        super
    end

    def move_diffs
        possible_moves = [[1,2],[2,1],[-1,-2],[-2,-1],[2,-1],[-1,2],[-2,1],[1,-2]]
    end
end
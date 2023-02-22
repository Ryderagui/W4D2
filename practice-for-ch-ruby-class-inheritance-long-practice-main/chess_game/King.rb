require_relative "Stepable.rb"
require_relative "Piece.rb"


class King < Piece
    include Stepable
    def initialize(color, board, pos)
        super
    end

    def move_diffs
        possible_moves = [[1,1],[1,-1],[-1,-1],[-1,1],[1,0],[-1,0],[0,1],[0,-1]]
    end

    def symbol 
        :K 
    end
end
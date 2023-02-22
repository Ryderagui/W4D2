require_relative "Slideable.rb"
require_relative "Piece.rb"


class Bishop < Piece
    include Slideable
    def initialize(color, board, pos)
        super
    end

    def move_dirs
        direction = [:diag]
    end

    def symbol 
        :B
    end
end
require_relative "Slideable.rb"
require_relative "Piece.rb"

class Queen < Piece
    include Slideable
    def initialize(color, board, pos)
        super
    end

    def move_dirs
        directions = [:horz, :vert, :diag]
    end

    def symbol
        :Q 
    end


end
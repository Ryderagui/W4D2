require_relative "Slideable.rb"
require_relative "Piece.rb"

class Rook < Piece
    include Slideable
    
    def initialize(color, board, pos)
        super
    end

    def move_dirs
        directions = [:horz, :vert]
    end

    def symbol 
        :R
    end
end
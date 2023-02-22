class Piece
    attr_reader :color,:board,:pos
    def initialize(color, board, pos)
        @color = color #symbol
        @board = board #board instance
        @pos = pos # [2,2] array
    end
end
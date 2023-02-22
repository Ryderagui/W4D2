# require_relative "Board.rb"
require 'byebug'

class Piece
    attr_reader :color,:board,:pos
    attr_accessor :board
    def initialize(color, board, pos)
        @color = color #symbol
        @board = board #board instance
        @pos = pos # [2,2] array
    end

    def to_s
        #Whenever puts get called, this gets called
        self.symbol.to_s
    end

    def symbol 
        :P
    end

    def empty?
        if self.is_a?(NullPiece)
            return true
        else
            return false
        end
    end

    def pos=(val)
        # Rook.pos = [0,1]
        # Change pos of the piece
        @pos = val
    end

    def inspect
        self.symbol
    end

    def valid_moves

        valids = []
        possible_moves = self.moves
        possible_moves.each do |move|
            copy = self.board.dup
            copy.move_piece(self.color,self.pos,move)
            valids << move if !copy.in_check?(self.color)
        end
        valids
    end

end
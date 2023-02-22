require_relative "Piece.rb"

class Pawn < Piece
    def initialize(color, board, pos)
        super
    end

    def at_start_row?
         self.color == :black && self.pos[0] == 1 || self.color == :white && self.pos[0] == 6
    end

    def side_attacks
        possible_moves = []
        x,y = self.pos
        opposite_color = self.color == :black ? :white : :black
        if self.color == :white
            if self.board[x-1,y-1].color == opposite_color
                possible_moves << [x-1,y-1]
            end
            if self.board[x-1,y+1].color == opposite_color
                possible_moves << [x-1,y+1]
            end
        end
        if self.color == :black
            if self.board[x+1,y+1].color == opposite_color
                possible_moves << [x+1,y+1]
            end
            if self.board[x+1,y-1].color == opposite_color
                possible_moves << [x+1,y-1]
            end
        end
        return possible_moves
    end

    def moves
        possible_moves = []
        possible_moves << self.side_attacks if !self.side_attacks.empty?
        x,y = pos
        if self.color == :white
            if self.board[x-1,y].color == nil
                possible_moves << [x-1,y]
            end
            if self.board[x-1,y].color == nil && self.at_start_row?
                possible_moves << [x-2, y]
            end
        elsif self.color == :black
            if self.board[x +1,y].color == nil
                possible_moves << [x + 1,y]
            end
            if self.board[x+1,y].color == nil && self.at_start_row?
                possible_moves << [x+2,y]
            end
        end
        possible_moves
    end
end
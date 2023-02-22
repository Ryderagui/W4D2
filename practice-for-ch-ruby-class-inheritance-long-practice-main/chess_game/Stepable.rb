require 'byebug'

module Stepable

    def moves
        # self.move_diffs is an array of move_deltas
        deltas = self.move_diffs
        x,y = self.pos
        possible_moves = []
        # debugger
        deltas.each do |move|
            row,col = move
            w,z = [row + x, col + y]
            if self.board.valid_pos?([w,z])
                if self.board[w,z].color == self.color
                    next
                elsif self.board[w,z].color != self.color
                    possible_moves << [w,z]
                elsif self.board[w,z].color == nil
                    possible_moves << [w,z]
                end
            end
        end

        possible_moves.select {|pos| pos[0].between?(0,7) && pos[1].between?(0,7)}
    end

    # def move_diffs
    #     king_possible_moves
        
    # end
end
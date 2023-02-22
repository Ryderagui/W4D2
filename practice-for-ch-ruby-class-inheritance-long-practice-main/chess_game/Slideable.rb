module Slideable
    def moves
        directions = self.move_dirs
        # possible directions [vert,horz,diag] 
        current_board = self.board
        x,y = self.pos
        moves = []
        horizontal = []
        opposite_color = self.color == :black ? :white : :black
        #Horizontal 
        (y+1..7).each do |i|
            if self.board[x,i].color == self.color 
                break
            elsif self.board[x,i].color == opposite_color
                horizontal << [x,i]
                break
            else
                horizontal << [x,i]
            end
        end
        (1..y).each do |i|
            if self.board[x,y-i].color == self.color
                break
            elsif self.board[x,y-i].color == opposite_color
                horizontal << [x, y-i]
                break
            else
                horizontal << [x,y-i]
            end
        end
        vertical = []
        (x+1..7).each do |i|
            if self.board[i,y].color == self.color
                break
            elsif self.board[i,y].color == opposite_color
                vertical << [i,y]
                break
            else
                vertical << [i,y]
            end
        end
        (1..x).each do |i|
            if self.board[x-i,y].color == self.color
                break
            elsif self.board[x-i,y].color == opposite_color
                vertical << [x-i,y]
                break
            else
                vertical << [x-i,y]
            end
        end
        diagonal = []
        max_coor = self.pos.max
        min_coor = self.pos.min
        (1..max_coor).each do |i|
            if self.board[x+i, y+i].color == self.color
                break
            elsif self.board[x + i, y+i].color == opposite_color
                diagonal << [x+i, y+i]
                break
            else
                diagonal << [x+i,y+i]
            end
        end
        (max_coor + 1..7).each do |i|
            if self.board[x-i,y-i].color == self.color
                break
            elsif self.board[x - i,y-i].color == opposite_color
                diagonal << [x-i,y-i]
                break
            else
                diagonal << [x-i, y-i]
            end
        end
        (x+1..7).each do |i|
            if self.board[x+i,y-i].color == self.color
                break
            elsif self.board[x+i,y-i].color == opposite_color
                diagonal << [x+i, y-i]
                break
            else
                diagonal << [x+i,y-i]
            end
        end
        (y+1..7).each do |i|
            if self.board[x-i,y+i].color == self.color
                break
            elsif self.board[x-i,y+i].color == opposite_color
                diagonal << [x-i,y+i]
                break
            else
                diagonal << [x-i,y+i]
            end
        end
        
        directions.each do |direction|
            if direction == :horz
                moves += horizontal
            elsif direction == :vert
                moves += veritcal
            elsif direction == :diag
                moves += diagonal
            end
        end
        
        moves
    end


end
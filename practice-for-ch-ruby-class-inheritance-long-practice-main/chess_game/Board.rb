require_relative "Piece.rb"
require_relative "Bishop.rb"
require_relative "King.rb"
require_relative "Knight.rb"
require_relative "Pawn.rb"
require_relative "NullPiece.rb"
require_relative "Queen.rb"
require_relative "Rook.rb"

class Board
    attr_reader :grid
    

    

    def initialize(grid = nil)
        @null_piece = NullPiece.instance
        grid ||= self.starting_board
        grid.each do |row|
            row.map! do |ele|
                if ele == nil
                    @null_piece
                else
                    ele
                end
            end
        end
        @grid = grid 
        
    end

    def starting_board
        null_piece = nil
        # starting_pos: top row = black: Rook0,0, Knight0,1, Bishop0,2, Queen0,3. King0,4, Bishop0,5, knight0,6, rook0,7
                        #send to top row : pawns x 8 (1, 0..7)
                        # 4 rows of null pieces(2..5,0..7)
                        #second from bottom white pawns x 8(6,0..7)
                        #bottomw row: white: rook7,0. knight7,1. bishop7,2, queen7,3, king7,4, bishop7,5, knight7,6, rook7,7
        color = [:black, :white]
        black_pieces = [Rook.new(color[0],self,[0,0]), Knight.new(color[0], self, [0,1]), Bishop.new(color[0], self, [0,2]), Queen.new(color[0], self, [0,3]),
            King.new(color[0], self, [0,4]), Bishop.new(color[0], self, [0,5]),Knight.new(color[0], self, [0,6]), Rook.new(color[0], self, [0,7])]
        black_pawns = [Pawn.new(color[0], self, [1,0]), Pawn.new(color[0], self, [1,1]), Pawn.new(color[0], self, [1,2]), Pawn.new(color[0], self, [1,3]),
        Pawn.new(color[0], self, [1,4]), Pawn.new(color[0], self, [1,5]), Pawn.new(color[0], self, [1,6]), Pawn.new(color[0], self, [1,7])]
        null_pieces = Array.new(4) {Array.new(8,null_piece)}
        # null_pos = Board.null_positions
        white_pieces = [Rook.new(color[1],self,[7,0]), Knight.new(color[1], self, [7,1]), Bishop.new(color[1], self, [7,2]), Queen.new(color[1], self, [7,3]),
            King.new(color[1], self, [7,4]), Bishop.new(color[1], self, [7,5]),Knight.new(color[1], self, [7,6]), Rook.new(color[1], self, [7,7])]
        white_pawns = [Pawn.new(color[1], self, [6,0]), Pawn.new(color[1], self, [6,1]), Pawn.new(color[1], self, [6,2]), Pawn.new(color[1], self, [6,3]),
        Pawn.new(color[1], self, [6,4]), Pawn.new(color[1], self, [6,5]), Pawn.new(color[1], self, [6,6]), Pawn.new(color[1], self, [6,7])] 
        grid = [black_pieces,black_pawns]+null_pieces+[white_pawns,white_pieces]

        grid
    end

    def [](x,y)
        @grid[x][y]
    end

    def []=(x,y,value)
        @grid[x][y] = value
    end

    def move_piece(color,start_pos,end_pos)
        x,y = start_pos
        w,z = end_pos
        raise "Empty Square" if self.[](x,y) == nil
        raise "That piece cannot go there" if !valid_pos?(end_pos)
        if self[x,y].color != color
            return 
        end
        if !self[x,y].valid_moves.include?(end_pos)
            return 
        end
    
        self[w,z] = self[x,y]
        self[x,y] = @null_piece
        # piece = self.[](start_pos)
        # piece.pos = end_pos
        true
        self[w,z].pos = [w,z]
    end

    def move_piece!(color,start_pos,end_pos)
        x,y = start_pos 
        w,z = end_pos
        raise "Empty Square" if self.[](x,y) == nil
        raise "That piece cannot go there" if !valid_pos?(end_pos)
        if self[x,y].color != color
            return 
        end 

        self[w,z] = self[x,y]
        self[x,y] = @null_piece
        # piece = self.[](start_pos)
        # piece.pos = end_pos
        true
        self[w,z].pos = [w,z]
    end

    def valid_pos?(pos)
        x,y = pos
        raise "Enter a not empty spot!" if pos == nil
        return false if x < 0 || y < 0 || x > 7 || y > 7
        true
    end

    def add_piece(piece,pos) 
        #Piece has to be a piece instance
        board[pos] = piece 
    end

    def checkmate?(color) #white
        self.grid.each do |row|
            row.each do |piece|
                if piece.color == color
                    if !piece.valid_moves.empty?
                        return false
                    end
                end
            end
        end
        return true
    end

    def in_check?(color)
        opposite_color = color == :black ? :white : :black
        king_pos = self.find_king(color)
        @grid.each do |row|
            row.each do |ele|
                if ele.moves.include?(king_pos) && !ele.is_a?(Pawn) && ele.color == opposite_color 
                    return true
                elsif ele.is_a?(Pawn) && ele.side_attacks.include?(king_pos) && ele.color == opposite_color
                    return true
                end
            end
        end
        return false
    end

    def find_king(color)
        #Loop through all positions, find piece thats a king of input color
        @grid.each do |row|
            row.each do |ele|
                if ele.is_a?(King) && ele.color == color
                    return ele.pos
                end
            end 
        end
    end

    def pieces
        
    end

    def dup
        grid = []
        self.grid.each do |row|
            temp_row = []
            row.each do |piece|
                piece_class = piece.class
                color = piece.color
                pos = piece.pos
                if piece_class != NullPiece
                    new_piece = piece_class.new(color,self,pos)
                else
                    new_piece = @null_piece
                end
                temp_row << new_piece
            end
            grid << temp_row
        end
        new_board = Board.new(grid)

        new_board.grid.each do |row|
            row.each do |piece|
                piece.board = new_board
            end
        end
        new_board
    end


    
end

if $PROGRAM_NAME == __FILE__
    nb = Board.new
    # # d = Display.new(nb)
    nb.move_piece!(:black, [0,2],[5,7])
    pawn = nb[6,6]
    p pawn
    p pawn.moves
    p nb.move_piece(:white,[6,6],[5,7])
    p nb
    # p piece
    # p piece.pos
    # p piece.moves
    # # q = nb[0,3]
    # # b = nb[0,5]
    # p nb.in_check?(:white)
    # p nb.in_check?(:black)
    # copy = nb.dup

    # p pawn = nb[1,0]
    # p pawn.moves
    # p pawn.valid_moves
    # copy.move_piece(:black,[1,0],[3,0])
    # p copy
    # p nb


end
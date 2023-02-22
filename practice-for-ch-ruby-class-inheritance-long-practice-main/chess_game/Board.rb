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
    def self.null_positions
        empty_array = []
        (2..5).each do |i|
            (0..7).each do |j|
                empty_array << [i,j]
            end
        end
        empty_array
    end

    def initialize
        @null_piece = NullPiece.instance
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
        null_pieces = Array.new(4) {Array.new(8,@null_piece)}
        # null_pos = Board.null_positions
        white_pieces = [Rook.new(color[1],self,[7,0]), Knight.new(color[1], self, [7,1]), Bishop.new(color[1], self, [7,2]), Queen.new(color[1], self, [7,3]),
            King.new(color[1], self, [7,4]), Bishop.new(color[1], self, [7,5]),Knight.new(color[1], self, [7,6]), Rook.new(color[1], self, [7,7])]
        white_pawns = [Pawn.new(color[1], self, [6,0]), Pawn.new(color[1], self, [6,1]), Pawn.new(color[1], self, [6,2]), Pawn.new(color[1], self, [6,3]),
        Pawn.new(color[1], self, [6,4]), Pawn.new(color[1], self, [6,5]), Pawn.new(color[1], self, [6,6]), Pawn.new(color[1], self, [6,7])] 
        @grid = [black_pieces,black_pawns]+null_pieces+[white_pawns,white_pieces]
    end

    def [](x,y)
        @grid[x][y]
    end

    def []=(x,y,value)
        @grid[x][y] = value
    end

    def move_piece(start_pos,end_pos)
        x,y = start_pos
        w,z = end_pos
        raise "Empty Square" if self.[](x,y) == nil
        
        raise "That piece cannot go there" if !valid_pos?(end_pos)

        self[w,z] = self[x,y]
        self[x,y] = @null_piece
        # piece = self.[](start_pos)
        # piece.pos = end_pos
        true
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

    def checkmate?(color)
    
    end

    def in_check?(color)
    end

    def find_king(color)
        #Loop through all positions, find piece thats a king of input color
    end

    def pieces
        
    end

    def dup
        @grid.dup
    end
     


    
end
require "byebug" 
class ComputerPlayer < Player
    #Pick a random move of moves of our color
    #If we want to be fancy, try to find 1 move checkmates but nah
    attr_reader :color,:display
    def initialize(color,display)
        super
    end

    def make_move 
        valid_pieces = []
        self.display.board.each do |row|
            row.each do |piece|
                if piece.color == self.color
                    piece << valid_pieces 
                end
            end
        end
    end

end


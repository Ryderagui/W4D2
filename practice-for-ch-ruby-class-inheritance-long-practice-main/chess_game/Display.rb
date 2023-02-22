require "colorize"
require_relative "Board.rb"
require_relative "Cursor.rb"
require "byebug"
class Display
    def initialize(board)
        @cursor = Cursor.new([0,0],board)
        @board = board
        
    end 

    def render
        #We want to print out board
        @board.grid.each do |row|
           row_letters = []
           row.each do |ele|
            # debugger
            if ele.pos == @cursor.cursor_pos
                new_string = ele.to_s.colorize(:red)
                row_letters << new_string
            elsif @board[@cursor.cursor_pos[0],@cursor.cursor_pos[1]].empty? && ele.is_a?(NullPiece)
                new_string = ele.to_s.colorize(:red)
                row_letters << new_string
            else 
                string = ele.to_s.colorize(ele.color)
                row_letters << string 
            end
           end
           puts row_letters.join(" ")
        end

    end

    def test_display
        while true
            self.render
        @cursor.get_input
        end
    end

end

if $PROGRAM_NAME == __FILE__
    d = Display.new(Board.new())
    d.render
    d.test_display
end
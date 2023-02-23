require "colorize"
require_relative "Board.rb"
require_relative "Cursor.rb"
require "byebug"
class Display
    attr_reader :cursor, :board
    def initialize(board)
        @cursor = Cursor.new([0,0],board)
        @board = board
        
    end 

    def render
        #We want to print out board
        @board.grid.each_with_index do |row,i|
           row_letters = []
           row.each_with_index do |ele,j|
            # debugger
            if @cursor.cursor_pos == [i,j]
                color = @cursor.selected == true ? :blue : :red
                new_string = ele.to_s.colorize(color)
                row_letters << new_string
            else
                new_string = ele.to_s.colorize(ele.color)
                row_letters << new_string
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
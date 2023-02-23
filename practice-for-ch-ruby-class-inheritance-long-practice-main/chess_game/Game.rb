require_relative "Player.rb"
require_relative "Display.rb"
require_relative "Board.rb"
require_relative "HumanPlayer.rb"
class Game 
    attr_reader :board,:display,:current_player
    def initialize()
        @board = Board.new
        @display = Display.new(@board)
        @player_1 = HumanPlayer.new(:white,@display)
        @player_2 = HumanPlayer.new(:black,@display)
        @current_player = @player_1
    end

    def swap_turn!
        @current_player = @current_player == @player_1 ? @player_2 : @player_1
    end

    def play
     
        #Until the game is over. which is checkmates
        until self.board.checkmate?(:black) || self.board.checkmate?(:white)
            p "#{self.current_player.color}'s Turn!"
            player_input = self.current_player.make_move
            color,start_pos,end_pos = player_input

            #check valid
            x,y = start_pos 
            if !self.board[x,y].valid_moves.include?(end_pos) 
                next 
            end
            self.board.move_piece(color,start_pos,end_pos)
            #If the move causes check, yell CHECK
            swap_turn!
            if self.board.in_check?(@current_player.color)
                p "CHECK!"
            end

        end
        self.display.render
        puts "CHECKMATE!"
    end

end

if $PROGRAM_NAME == __FILE__
    game = Game.new 
    game.play
end
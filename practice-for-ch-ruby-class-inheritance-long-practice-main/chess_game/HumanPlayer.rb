require_relative "Player.rb"

class HumanPlayer < Player
    def initialize(color,display)
        super
    end

    def make_move
        #Get input throws a cursor position or nil
        #When we press space bar, we change colors and return cursor pos
        #Otherwise we move around and return nil
        
        #How do we move a piece. Need a color and two positions
        #Stop once, select goes from true -> false and the result is a valid move \
        #Output of this method is a move [color,pos1,pos2]
      
        color = self.color 
        pos1 = []
        pos2 = []
        while true
            #Either get nil or get a pos
            # We can selected 
            self.display.render
            attempt = self.display.cursor.get_input
            if self.display.cursor.selected == true && pos1.empty?
                pos1 = attempt
            end
            if self.display.cursor.selected == false && !pos1.empty?
                pos2 = attempt
            end

            if !pos1.empty? && !pos2.empty?
                return [color,pos1,pos2]
            end              
        end 
    end



    

end
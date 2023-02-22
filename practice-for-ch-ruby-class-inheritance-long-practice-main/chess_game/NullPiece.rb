require "singleton"
require_relative "Piece.rb"
class NullPiece < Piece
    include Singleton
    def initialize
        @symbol = "_"
        @color = :green
    end

    def moves
        []
    end

    attr_reader :symbol, :color

end
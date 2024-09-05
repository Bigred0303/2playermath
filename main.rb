require './player'
require './question'
require './game'

# Create players
player1 = Player.new("Player 1")
player2 = Player.new("Player 2")

# Start the game
game = Game.new(player1, player2)
game.play
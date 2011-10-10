require_relative '../lib/game.rb'
require_relative '../lib/human.rb'
require_relative '../lib/minimax.rb'

players = [Human.new("x"), Minimax.new("o")]
players.shuffle!
game = Game.new(players.first, players.last)

# the main game loop!
until game.over?
  game.board.print
  game.take_next_turn
end

# displays the winner
game.board.print
if game.won? == true
  puts "We have a winner! o__o"
else
  puts "It is a draw. u__u"
end
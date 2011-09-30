require_relative '../lib/game.rb'
require_relative '../lib/compy.rb'
require_relative '../lib/human.rb'



#puts "Choose a team (x or o)"
#team_choice = gets.chomp
#while !game.valid_team?(team_choice)
#  puts "That is neither x nor o!"
#  team_choice = gets.chomp
#end
#game.set_teams(team_choice)

players = [Human.new("x"), Compy.new("o")]
players.shuffle!
game = Game.new(players.first, players.last)

GameRunner.run(game)
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
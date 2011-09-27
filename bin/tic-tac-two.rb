require_relative '../lib/game.rb'

# setup some variables & stuff
game = Game.new
first_player = nil
turn_counter = nil
winner = "your mom"



# get the player's team choice
puts "Choose a team (x or o)"
team_choice = gets.chomp
# verify that this choice is valid
while !game.valid_team?(team_choice)
  puts "That is neither x nor o!"
  team_choice = gets.chomp
end
# assign teams based on player input
game.set_teams team_choice
# set first player
if rand(2) == 0
  first_player = game.player_team
  turn_counter = game.player_team
else
  first_player = game.compy_team
  turn_counter = game.compy_team
end



# the main game loop!
while !game.over?

  game.print

  # player's turn!
  if turn_counter == game.player_team
    # get the player's move
    puts "Where will you move? Pick an empty space, 1-9."
    move_choice = gets.chomp.to_i
    #verify that this choice is valid
    while !game.valid_move?(move_choice)
      puts "That is neither x nor o!"
      move_choice = gets.chomp.to_i
    end
    game.make_move(move_choice-1, game.player_team)
    turn_counter = game.compy_team

  # compy's turn!
  else
    puts "compy turn"
    if game.try_to_win
      if game.block_player
        if first_player == game.compy_team
          game.make_offensive_move
        else
          game.make_defensive_move
        end
      end
    end
    turn_counter = game.player_team
  end
end



# displays the winner
game.print
if game.won? == true
  puts "We have a winner! o__o"
else
  puts "It is a draw. u__u"
end
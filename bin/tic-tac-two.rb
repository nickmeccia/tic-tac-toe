require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/compy.rb'

game = Game.new
board = Board.new("x", "o")
compy = Compy.new("o")

first_player = nil
turn_counter = "x"
winner = "your mom"



#puts "Choose a team (x or o)"
#team_choice = gets.chomp
#while !game.valid_team?(team_choice)
#  puts "That is neither x nor o!"
#  team_choice = gets.chomp
#end
#game.set_teams(team_choice)

#if rand(2) == 0
#  first_player = game.player_team
#  turn_counter = game.player_team
#else
#  first_player = game.compy_team
#  turn_counter = game.compy_team
#end



# the main game loop!
while !game.over?(board)
  board.print

  # player's turn!
  if turn_counter == board.player_one
    puts "Where will you move? Pick an empty space, 1-9."
    move_choice = gets.chomp.to_i
    while !board.valid_move?(move_choice)
      puts "That is not a valid move!"
      move_choice = gets.chomp.to_i
    end
    board.set_cell(move_choice-1, board.player_one)
    turn_counter = board.player_two

  # compy's turn!
  else
    puts "compy turn"
    board.set_cell(compy.move_for(board), board.player_two)
    turn_counter = board.player_one
  end
end



# displays the winner
board.print
if game.won?(board) == true
  puts "We have a winner! o__o"
else
  puts "It is a draw. u__u"
end
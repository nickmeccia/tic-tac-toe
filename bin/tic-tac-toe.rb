require_relative '../lib/setup.rb'
require_relative '../lib/upkeep.rb'
require_relative '../lib/player.rb'
require_relative '../lib/compy.rb'

#  setup!
player_team = get_player_team
compy_team = set_compy_team(player_team)
board = initialize_board
turn_counter = get_first_player
first_player = turn_counter
winner = "your mom"

while did_anyone_win(board, winner) == false
  #  upkeep!
  print_board board
  puts "It is this player's turn:  #{turn_counter}"
  #  player's turn!
  if turn_counter == player_team
    board[get_space-1] = player_team
    turn_counter = compy_team
  #  compy's turn!
  else
    board = try_to_win(board, compy_team, player_team)
    board = block_player(board, compy_team, player_team)
    if first_player == player_team
      board = calculate_defensive_move(board, compy_team, player_team)
    else 
      board = calculate_offensive_move(board, compy_team, player_team)
    end
    turn_counter = player_team
  end
end

print_board board
puts "The winner is #{did_anyone_win(board, winner)}!"

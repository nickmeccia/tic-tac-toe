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
  if is_it_a_draw(board, compy_team, player_team) == true
    break
  end
  #  upkeep!
  print_board board
  puts "It is this player's turn:  #{turn_counter}"
  #  player's turn!
  if turn_counter == player_team
    board[get_space(board, compy_team, player_team)-1] = player_team
    turn_counter = compy_team
  #  compy's turn!
  else
    puts "compy's turn!"
    loop do
      board_copy = Array.new(board)
      if board != try_to_win(board_copy, compy_team, player_team)
        puts "main: trying to win"
        board = try_to_win(board, compy_team, player_team)
        break
      elsif board != block_player(board_copy, compy_team, player_team)
        puts "main: blocking the player"
        board = block_player(board, compy_team, player_team)
        break
      else
        if first_player == player_team
          puts "main: making a defensive move"
          board = calculate_defensive_move(board, compy_team, player_team)
          break
        else
          puts "main: making an offensive move"
          board = calculate_offensive_move(board, compy_team, player_team)
          break
        end
      end
    end

    turn_counter = player_team
    puts "it is now the player's turn"
  end
end

print_board board
if did_anyone_win(board, winner) == "o" || did_anyone_win(board, winner) == "x"
  puts "The winner is #{did_anyone_win(board, winner)}!"
else
  puts "It is a draw!"
end
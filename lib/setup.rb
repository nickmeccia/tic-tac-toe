def get_player_team
  puts "Choose a team (x or o)"
  input = gets.chomp
  unless input == "x" || input == "X" || input == "o" || input == "O"
    puts "That is neither x nor o!"
    get_player_team
  else
    input = "x" if input == "X"
    input = "o" if input == "O"
    return input
  end
end

def set_compy_team player_team
  if player_team == "x"
    return "o"
  else
    return "x"
  end
end

def initialize_board
  board = []
  (1..9).each do |c|
  	board[c-1] = c
  end
  return board
end

def get_first_player
  if rand(2) == 0
    return "o"
  else
    return "x"
  end
end
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

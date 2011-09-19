def get_space board, compy_team, player_team

  input = 42
  
  loop do
    puts "\n Where will you move? Pick an empty space, 1-9"
    input = gets.chomp.to_i

    if input == 1 || input == 2 || input == 3 || input == 4 || input == 5 || input == 6 || input == 7 || input == 8 || input == 9
      if board[input-1] != compy_team && board[input-1] != player_team
        break
      end
    end
#      puts "That is not a real space!"
#    if  board[input-1] == compy_team || board[input-1] == player_team
#      puts "That space is taken!"
    puts "That is not a valid space!"
  end
  
  return input
end



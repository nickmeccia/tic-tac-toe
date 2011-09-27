def try_to_win board, compy_team, player_team
  loop do
    if board[0] == compy_team && board[1] == compy_team && board[2] != player_team
      board[2] = compy_team
      break
    end
    if board[1] == compy_team && board[2] == compy_team && board[0] != player_team
      board[0] = compy_team
      break
    end
    if board[3] == compy_team && board[4] == compy_team && board[5] != player_team
      board[5] = compy_team
      break
    end
    if board[4] == compy_team && board[5] == compy_team && board[3] != player_team
      board[3] = compy_team
      break
    end
    if board[6] == compy_team && board[7] == compy_team && board[8] != player_team
      board[8] = compy_team
      break
    end
    if board[7] == compy_team && board[8] == compy_team && board[6] != player_team
      board[6] = compy_team
      break
    end




    if board[0] == compy_team && board[3] == compy_team && board[6] != player_team
      board[6] = compy_team
      break
    end
    if board[3] == compy_team && board[6] == compy_team && board[0] != player_team
      board[0] = compy_team
      break
    end
    if board[1] == compy_team && board[4] == compy_team && board[7] != player_team
      board[7] = compy_team
      break
    end
    if board[4] == compy_team && board[7] == compy_team && board[1] != player_team
      board[1] = compy_team
      break
    end
    if board[2] == compy_team && board[5] == compy_team && board[8] != player_team
      board[8] = compy_team
      break
    end
    if board[5] == compy_team && board[8] == compy_team && board[2] != player_team
      board[2] = compy_team
      break
    end



  
    if board[0] == compy_team && board[4] == compy_team && board[8] != player_team
      board[8] = compy_team
      break
    end
    if board[4] == compy_team && board[8] == compy_team && board[0] != player_team
      board[0] = compy_team
      break
    end
    if board[2] == compy_team && board[4] == compy_team && board[6] != player_team
      board[6] = compy_team
      break
    end
    if board[4] == compy_team && board[8] == compy_team && board[6] != player_team
      board[6] = compy_team
      break
    end

  

    if board[0] == compy_team && board[2] == compy_team && board[1] != player_team
      board[1] = compy_team
      break
    end
    if board[3] == compy_team && board[5] == compy_team && board[4] != player_team
      board[4] = compy_team
      break
    end
    if board[6] == compy_team && board[8] == compy_team && board[7] != player_team
      board[7] = compy_team
      break
    end
    if board[0] == compy_team && board[6] == compy_team && board[3] != player_team
      board[3] = compy_team
      break
    end
    if board[1] == compy_team && board[7] == compy_team && board[4] != player_team
      board[4] = compy_team
      break
    end
    if board[2] == compy_team && board[8] == compy_team && board[5] != player_team
      board[5] = compy_team
      break
    end
    if board[0] == compy_team && board[8] == compy_team && board[4] != player_team
      board[4] = compy_team
      break
    end
    if board[2] == compy_team && board[6] == compy_team && board[4] != player_team
      board[4] = compy_team
      break
    end
    puts "did not win"
    break
  end
  
  puts "definitely tried to win"
  return board
end

#    012
#    345
#    678


def block_player board, compy_team, player_team
  loop do
    if board[0] == player_team && board[1] == player_team && board[2] != compy_team
      board[2] = compy_team
      break
    end
    if board[1] == player_team && board[2] == player_team && board[0] != compy_team
      board[0] = compy_team
      break
    end
    if board[3] == player_team && board[4] == player_team && board[5] != compy_team
      board[5] = compy_team
      break
    end
    if board[4] == player_team && board[5] == player_team && board[3] != compy_team
      board[3] = compy_team
      break
    end
    if board[6] == player_team && board[7] == player_team && board[8] != compy_team
      board[8] = compy_team
      break
    end
    if board[7] == player_team && board[8] == player_team && board[6] != compy_team
      board[6] = compy_team
      break
    end




    if board[0] == player_team && board[3] == player_team && board[6] != compy_team
      board[6] = compy_team
      break
    end
    if board[3] == player_team && board[6] == player_team && board[0] != compy_team
      board[0] = compy_team
      break
    end
    if board[1] == player_team && board[4] == player_team && board[7] != compy_team
      board[7] = compy_team
      break
    end
    if board[4] == player_team && board[7] == player_team && board[1] != compy_team
      board[1] = compy_team
      break
    end
    if board[2] == player_team && board[5] == player_team && board[8] != compy_team
      board[8] = compy_team
      break
    end
    if board[5] == player_team && board[8] == player_team && board[2] != compy_team
      board[2] = compy_team
      break
    end



  
    if board[0] == player_team && board[4] == player_team && board[8] != compy_team
      board[8] = compy_team
      break
    end
    if board[4] == player_team && board[8] == player_team && board[0] != compy_team
      board[0] = compy_team
      break
    end
    if board[2] == player_team && board[4] == player_team && board[6] != compy_team
      board[6] = compy_team
      break
    end
    if board[4] == player_team && board[8] == player_team && board[6] != compy_team
      board[6] = compy_team
      break
    end

  

    if board[0] == player_team && board[2] == player_team && board[1] != compy_team
      board[1] = compy_team
      break
    end
    if board[3] == player_team && board[5] == player_team && board[4] != compy_team
      board[4] = compy_team
      break
    end
    if board[6] == player_team && board[8] == player_team && board[7] != compy_team
      board[7] = compy_team
      break
    end
    if board[0] == player_team && board[6] == player_team && board[3] != compy_team
      board[3] = compy_team
      break
    end
    if board[1] == player_team && board[7] == player_team && board[4] != compy_team
      board[4] = compy_team
      break
    end
    if board[2] == player_team && board[8] == player_team && board[5] != compy_team
      board[5] = compy_team
      break
    end
    if board[0] == player_team && board[8] == player_team && board[4] != compy_team
      board[4] = compy_team
      break
    end
    if board[2] == player_team && board[6] == player_team && board[4] != compy_team
      board[4] = compy_team
      break
    end
    puts "did not block the player"
    break
  end
  puts "definitely tried to block the player"
  return board
end

# 012
# 345
# 678

def calculate_defensive_move(board, compy_team, player_team)
  if board[4] != compy_team && board[4] != player_team
    board[4] = compy_team
    puts "chose the center"
    return board
  end
  
  loop do
    random_space = rand(9)
    puts "defensive move: this is the random space #{random_space}"
    if board[random_space] != player_team && board[random_space] != compy_team
      board[random_space] = compy_team
      puts "defensive move: chose this random space #{random_space}"
      break
    end
  end
  return board

end

# 012
# 345
# 678

def calculate_offensive_move board, compy_team, player_team
  loop do
    random_number = rand(4)
    puts "offensive move: this is the random number: #{random_number}"
    if random_number == 0
      if board[0] != compy_team && board[0] != player_team
        board[0] = compy_team
        puts "updated board"
        break
      end
    end
    if random_number == 1
      if board[2] != compy_team && board[2] != player_team
        board[2] = compy_team
        break
      end
    end
    if random_number == 2
      if board[6] != compy_team && board[6] != player_team
        board[6] = compy_team
        break
      end
    end
    if random_number == 3
      if board[8] != compy_team && board[8] != player_team
        board[8] = compy_team
        break
      end
    end

  end
  return board
end
  
  
  
  
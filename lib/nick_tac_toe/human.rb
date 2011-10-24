class Human < Player  
  def move_for(board)
    puts "Where will you move? Pick an empty space, 1-9."
    move_choice = gets.chomp.to_i
    while !board.valid_move?(move_choice)
      puts "That is not a valid move!"
      move_choice = gets.chomp.to_i
    end
    return move_choice - 1
  end
end


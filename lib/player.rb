def get_space  
  puts "\n Where will you move? Pick an empty space, 1-9"
  input = gets.chomp.to_i
  unless input == 1 || input == 2 || input == 3 || input == 4 || input == 5 || input == 6 || input == 7 || input == 8 || input == 9
    puts "That is not a real space!"
    get_space
  end
  return input
end
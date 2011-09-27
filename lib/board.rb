class Board
    
  def initialize
    @cells = ["", "", "", "", "", "", "", "", ""]
  end

  def get_cell position
    @cells[position]
  end

  def set_cell position, team
    @cells[position] = team
  end
  
  
end
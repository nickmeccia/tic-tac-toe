class Move
  attr_accessor :position, :rating
  def initialize(position, rating)
    @position = position
    @rating = rating
  end
end

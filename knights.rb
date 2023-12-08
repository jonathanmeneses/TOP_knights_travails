

class Destination
  attr_accessor :location, :predecessor
  def initialize(coords, predecessor = nil)
    @location = coords
    @predecessor = predecessor
  end

  def potential_moves(coords = self.location)
    move_vectors = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
    destinations = move_vectors.map { |x, y| [coords[0] + x, coords[1] + y] }
    destinations.select { |x, y| x.between?(0, 7) && y.between?(0, 7) }
  end

class Knight
  attr_accessor :visited, :starting_square


  def initialize(starting_square = [0,0])
    @visited = Hash.new()
    @start = Destination.new(starting_square)
  end

  def knight_moves(starting_square = self.start, target_square)
    queue = [self.start]

    until queue.empty? or self.visited.include?(target_square)
      square_to_explore = queue.shift
      while target_square
    end

  end

end


board = Destination.new([2,1])

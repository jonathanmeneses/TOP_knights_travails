

class Destination
  attr_accessor :location
  def initialize(coords)
    @location = coords
  end

  def potential_moves(coords = self.location)
    move_vectors = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
    destinations = move_vectors.map { |x, y| [coords[0] + x, coords[1] + y] }
    destinations.select { |x, y| x.between?(0, 7) && y.between?(0, 7) }
  end
end

class Knight
  attr_accessor :visited, :start


  def initialize(starting_square = [0,0])
    @visited = Hash.new()
    @start = Destination.new(starting_square)
  end

  def knight_moves(starting_square = self.start, target_square)
    queue = [starting_square]

    until queue.empty? || self.visited.include?(target_square)
      square_to_explore = queue.shift
      potential_moves = square_to_explore.potential_moves
      deduped_moves = potential_moves.select {|destination| !self.visited.include?(destination)}
      # !self.visited.inclue?(destination.location)}
      deduped_moves.each do |destination|
        self.visited[destination] = square_to_explore.location
        queue << Destination.new(destination)
      end

    end
    # reversing the path
    reverse_square = target_square
    path = [reverse_square]
    until reverse_square == starting_square.location
      reverse_square = self.visited[reverse_square]
      path <<reverse_square
    end
    # path << starting_square.location
    path = path.reverse

    puts "You made it in #{path.length} moves! Here's your path"
    path.each {|x,y| puts "[#{x},#{y}]"}

  end

end


board = Destination.new([2,1])
knight = Knight.new([3,3])
knight.knight_moves([0,0])
# p knight.visited

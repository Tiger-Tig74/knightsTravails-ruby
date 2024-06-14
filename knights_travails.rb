def knight_moves(start, goal)
  moves = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]

  queue = [[start]]
  visited = Set.new([start])

  until queue.empty?
    path = queue.shift
    current_pos = path.last

    return path if current_pos == goal

    moves.each do |move|
      new_pos = [current_pos[0] + move[0], current_pos[1] + move[1]]
      if valid_position?(new_pos) && !visited.include?(new_pos)
        queue << (path + [new_pos])
        visited.add(new_pos)
      end
    end
  end
end

def valid_position?(pos)
  pos[0].between?(0, 7) && pos[1].between?(0, 7)
end

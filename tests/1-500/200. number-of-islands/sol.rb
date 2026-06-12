def num_islands(grid)
  rows = grid.length
  cols = grid[0].length
  islands = 0
  directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]

  (0...rows).each do |r|
    (0...cols).each do |c|
      next unless grid[r][c] == "1"

      islands += 1
      queue = [[r, c]]
      index = 0
      grid[r][c] = "0"
      while index < queue.length
        row, col = queue[index]
        index += 1
        directions.each do |dr, dc|
          nr = row + dr
          nc = col + dc
          next unless nr >= 0 && nr < rows && nc >= 0 && nc < cols && grid[nr][nc] == "1"

          grid[nr][nc] = "0"
          queue << [nr, nc]
        end
      end
    end
  end

  islands
end

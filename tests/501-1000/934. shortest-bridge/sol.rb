# @param {Integer[][]} grid
# @return {Integer}
def shortest_bridge(grid)
    n = grid.length
    directions = [[-1, 0], [1, 0], [0, 1], [0, -1]]
    visited = Set.new
    q = []
    
    dfs = lambda do |r, c|
      visited.add([r, c])
      directions.each do |dr, dc|
        nr = r + dr
        nc = c + dc
        if nr >= 0 && nr < n && nc >= 0 && nc < n && !visited.include?([nr, nc])
          if grid[nr][nc] == 0
            visited.add([nr, nc])
            q << [nr, nc, 1]
          else
            dfs.call(nr, nc)
          end
        end
      end
    end
    
    found = false
    (0...n).each do |i|
      (0...n).each do |j|
        if grid[i][j] == 1
          dfs.call(i, j)
          found = true
          break
        end
      end
      break if found
    end
    
    while !q.empty?
      r, c, dist = q.shift
      directions.each do |dr, dc|
        nr = r + dr
        nc = c + dc
        if nr >= 0 && nr < n && nc >= 0 && nc < n && !visited.include?([nr, nc])
          return dist if grid[nr][nc] == 1
          visited.add([nr, nc])
          q << [nr, nc, dist + 1]
        end
      end
    end
    0
end

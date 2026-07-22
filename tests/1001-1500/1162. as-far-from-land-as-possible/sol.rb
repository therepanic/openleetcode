# @param {Integer[][]} grid
# @return {Integer}
def max_distance(grid)
    return -1 if grid.nil? || grid.empty? || grid[0].nil? || grid[0].empty?
    
    n = grid.length
    frontier = []
    
    (0...n).each do |r|
        (0...n).each do |c|
            frontier << [r, c] if grid[r][c] == 1
        end
    end
    
    return -1 if frontier.empty? || frontier.length == n * n
    
    directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    distance = -1
    
    until frontier.empty?
        next_frontier = []
        distance += 1
        
        frontier.each do |r, c|
            directions.each do |dr, dc|
                nr, nc = r + dr, c + dc
                
                if nr >= 0 && nr < n && nc >= 0 && nc < n && grid[nr][nc] == 0
                    grid[nr][nc] = 1
                    next_frontier << [nr, nc]
                end
            end
        end
        
        frontier = next_frontier
    end
    
    distance
end

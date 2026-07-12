# @param {Integer[][]} grid
# @return {Integer}
def shortest_path_binary_matrix(grid)
    n = grid.length
    
    return -1 if grid[0][0] == 1 || grid[n-1][n-1] == 1
    return 1 if n == 1
    
    dist = Array.new(n) { Array.new(n, Float::INFINITY) }
    dist[0][0] = 1
    
    q = [[0, 0, 1]]
    
    directions = [
        [-1, 0], [-1, -1], [0, 1], [-1, 1],
        [1, 0], [1, -1], [0, -1], [1, 1]
    ]
    
    while !q.empty?
        r, c, dis = q.shift
        
        directions.each do |dr, dc|
            nr = r + dr
            nc = c + dc
            
            if nr >= 0 && nr < n && nc >= 0 && nc < n &&
               grid[nr][nc] == 0 && dis + 1 < dist[nr][nc]
                
                dist[nr][nc] = dis + 1
                
                return dis + 1 if nr == n - 1 && nc == n - 1
                
                q << [nr, nc, dis + 1]
            end
        end
    end
    
    -1
end

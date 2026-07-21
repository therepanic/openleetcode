# @param {Integer[][]} grid
# @return {Integer}
def get_maximum_gold(grid)
    n = grid.length
    m = grid[0].length
    
    visited = Array.new(n) { Array.new(m, false) }
    directions = [[-1, 0], [0, 1], [1, 0], [0, -1]]
    
    dfs = lambda do |r, c|
        total = grid[r][c]
        visited[r][c] = true
        
        curr = 0
        directions.each do |dr, dc|
            nr = r + dr
            nc = c + dc
            if nr >= 0 && nr < n && nc >= 0 && nc < m
                if grid[nr][nc] != 0 && !visited[nr][nc]
                    a = dfs.call(nr, nc)
                    curr = [curr, a].max
                end
            end
        end
        total += curr
        visited[r][c] = false
        total
    end
    
    ans = 0
    (0...n).each do |i|
        (0...m).each do |j|
            if !visited[i][j] && grid[i][j] != 0
                ans = [ans, dfs.call(i, j)].max
            end
        end
    end
    ans
end

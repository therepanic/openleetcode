# @param {Integer[][]} grid
# @return {Boolean}
def has_valid_path(grid)
    m = grid.length
    n = grid[0].length
    
    dir = {
        1 => [[0, -1], [0, 1]],
        2 => [[-1, 0], [1, 0]],
        3 => [[0, -1], [1, 0]],
        4 => [[0, 1], [1, 0]],
        5 => [[0, -1], [-1, 0]],
        6 => [[0, 1], [-1, 0]]
    }
    
    vis = Array.new(m) { Array.new(n, false) }
    q = [[0, 0]]
    vis[0][0] = true
    
    while !q.empty?
        r, c = q.shift
        
        return true if r == m - 1 && c == n - 1
        
        dir[grid[r][c]].each do |dr, dc|
            nr = r + dr
            nc = c + dc
            
            next if nr < 0 || nc < 0 || nr >= m || nc >= n || vis[nr][nc]
            
            dir[grid[nr][nc]].each do |bdr, bdc|
                if nr + bdr == r && nc + bdc == c
                    vis[nr][nc] = true
                    q.push([nr, nc])
                end
            end
        end
    end
    
    false
end

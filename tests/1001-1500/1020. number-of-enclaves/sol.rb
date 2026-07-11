# @param {Integer[][]} grid
# @return {Integer}
def num_enclaves(grid)
    total = grid.sum { |row| row.sum }
    m = grid.length
    n = grid[0].length
    return 0 if m == 1 || n == 1
    
    seen = Set.new
    q = []
    
    (0...n).each do |i|
        if grid[0][i] == 1
            q << [0, i]
            seen.add([0, i])
        end
        if grid[m-1][i] == 1
            q << [m-1, i]
            seen.add([m-1, i])
        end
    end
    
    (1...m-1).each do |i|
        if grid[i][0] == 1
            q << [i, 0]
            seen.add([i, 0])
        end
        if grid[i][n-1] == 1
            q << [i, n-1]
            seen.add([i, n-1])
        end
    end
    
    directions = [[0,1],[1,0],[0,-1],[-1,0]]
    next_total = 0
    
    while !q.empty?
        x, y = q.shift
        next_total += 1
        directions.each do |dx, dy|
            nx = x + dx
            ny = y + dy
            if nx >= 0 && nx < m && ny >= 0 && ny < n && grid[nx][ny] == 1 && !seen.include?([nx, ny])
                q << [nx, ny]
                seen.add([nx, ny])
            end
        end
    end
    
    total - next_total
end

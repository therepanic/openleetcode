# @param {Integer[][]} grid
# @return {Integer}
def closed_island(grid)
    m, n = grid.length, grid[0].length
    res = 0
    (0...m).each do |i|
        (0...n).each do |j|
            next if grid[i][j] == 1
            stack = [[i, j]]
            grid[i][j] = 1
            closed = true
            while !stack.empty?
                r, c = stack.pop
                if r == 0 || c == 0 || r == m - 1 || c == n - 1
                    closed = false
                end
                [[1, 0], [-1, 0], [0, 1], [0, -1]].each do |dr, dc|
                    nr, nc = r + dr, c + dc
                    if nr >= 0 && nr < m && nc >= 0 && nc < n && grid[nr][nc] == 0
                        grid[nr][nc] = 1
                        stack.push([nr, nc])
                    end
                end
            end
            res += 1 if closed
        end
    end
    res
end

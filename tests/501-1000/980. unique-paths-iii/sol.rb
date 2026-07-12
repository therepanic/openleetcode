# @param {Integer[][]} grid
# @return {Integer}
def unique_paths_iii(grid)
    m, n = grid.length, grid[0].length
    sx = sy = -1
    count = 0
    (0...m).each do |i|
        (0...n).each do |j|
            count += 1 if grid[i][j] == 0
            if grid[i][j] == 1
                sx, sy = i, j
            end
        end
    end
    
    backtrack = lambda do |i, j, count|
        result = 0
        [[i-1, j], [i+1, j], [i, j-1], [i, j+1]].each do |x, y|
            next unless (0...m).cover?(x) && (0...n).cover?(y)
            if grid[x][y] == 2
                result += 1 if count == 0
            elsif grid[x][y] == 0
                grid[x][y] = -1
                result += backtrack.call(x, y, count - 1)
                grid[x][y] = 0
            end
        end
        result
    end
    
    backtrack.call(sx, sy, count)
end

# @param {Integer[][]} grid
# @return {Integer}
def min_days(grid)
    count_islands = lambda do
        seen = Set.new
        dfs = lambda do |r, c|
            stack = [[r, c]]
            while !stack.empty?
                x, y = stack.pop
                [[x-1, y], [x+1, y], [x, y-1], [x, y+1]].each do |nx, ny|
                    if nx >= 0 && nx < grid.length && ny >= 0 && ny < grid[0].length && grid[nx][ny] == 1 && !seen.include?([nx, ny])
                        seen.add([nx, ny])
                        stack << [nx, ny]
                    end
                end
            end
        end
        
        islands = 0
        (0...grid.length).each do |i|
            (0...grid[0].length).each do |j|
                if grid[i][j] == 1 && !seen.include?([i, j])
                    islands += 1
                    seen.add([i, j])
                    dfs.call(i, j)
                end
            end
        end
        islands
    end
    
    return 0 if count_islands.call != 1
    
    (0...grid.length).each do |i|
        (0...grid[0].length).each do |j|
            if grid[i][j] == 1
                grid[i][j] = 0
                return 1 if count_islands.call != 1
                grid[i][j] = 1
            end
        end
    end
    
    2
end

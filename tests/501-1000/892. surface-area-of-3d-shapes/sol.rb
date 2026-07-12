# @param {Integer[][]} grid
# @return {Integer}
def surface_area(grid)
    n = grid.length
    area = 0
    (0...n).each do |i|
        (0...n).each do |j|
            if grid[i][j] != 0
                area += grid[i][j] * 6
                area -= (grid[i][j] - 1) * 2
                if i + 1 < n
                    area -= 2 * [grid[i][j], grid[i + 1][j]].min
                end
                if j + 1 < n
                    area -= 2 * [grid[i][j], grid[i][j + 1]].min
                end
            end
        end
    end
    area
end

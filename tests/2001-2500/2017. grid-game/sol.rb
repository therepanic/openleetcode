# @param {Integer[][]} grid
# @return {Integer}
def grid_game(grid)
    min_result = Float::INFINITY
    row1_sum = grid[0].sum
    row2_sum = 0
    
    (0...grid[0].length).each do |i|
        row1_sum -= grid[0][i]
        min_result = [min_result, [row1_sum, row2_sum].max].min
        row2_sum += grid[1][i]
    end
    
    min_result
end

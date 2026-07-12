# @param {Integer[][]} grid
# @return {Integer}
def max_increase_keeping_skyline(grid)
    n = grid.length
    row_max = grid.map { |row| row.max }
    col_max = (0...n).map { |c| grid.map { |row| row[c] }.max }
    gain = 0
    (0...n).each do |r|
        (0...n).each do |c|
            gain += [row_max[r], col_max[c]].min - grid[r][c]
        end
    end
    gain
end

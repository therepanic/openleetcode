# @param {Integer[][]} grid
# @return {Integer}
def count_servers(grid)
    row_counts = grid.map { |row| row.sum }
    col_counts = (0...grid[0].length).map { |col| grid.sum { |row| row[col] } }
    grid.each_with_index.sum do |row, r|
        row.each_with_index.sum do |cell, c|
            cell == 1 && (row_counts[r] > 1 || col_counts[c] > 1) ? 1 : 0
        end
    end
end

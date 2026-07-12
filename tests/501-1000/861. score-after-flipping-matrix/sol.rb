# @param {Integer[][]} grid
# @return {Integer}
def matrix_score(grid)
    rows = grid.length
    cols = grid[0].length
    grid.each do |row|
        if row[0] == 0
            (0...cols).each { |i| row[i] ^= 1 }
        end
    end
    (1...cols).each do |j|
        temp = 0
        (0...rows).each { |i| temp += grid[i][j] }
        if 2 * temp < rows
            (0...rows).each { |i| grid[i][j] ^= 1 }
        end
    end
    ans = 0
    grid.each do |row|
        ans += row.join.to_i(2)
    end
    ans
end

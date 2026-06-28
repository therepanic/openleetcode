# @param {Integer} m
# @param {Integer} n
# @param {Integer} max_move
# @param {Integer} start_row
# @param {Integer} start_column
# @return {Integer}
def find_paths(m, n, max_move, start_row, start_column)
    mod = 10**9 + 7
    dp = Array.new(max_move + 1) { Array.new(m) { Array.new(n, 0) } }
    directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]

    (1..max_move).each do |move|
        (0...m).each do |i|
            (0...n).each do |j|
                directions.each do |dx, dy|
                    x, y = i + dx, j + dy
                    if x < 0 || x >= m || y < 0 || y >= n
                        dp[move][i][j] += 1
                    else
                        dp[move][i][j] = (dp[move][i][j] + dp[move - 1][x][y]) % mod
                    end
                end
            end
        end
    end

    dp[max_move][start_row][start_column] % mod
end

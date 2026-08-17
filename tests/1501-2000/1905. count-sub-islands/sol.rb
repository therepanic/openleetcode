# @param {Integer[][]} grid1
# @param {Integer[][]} grid2
# @return {Integer}
def count_sub_islands(grid1, grid2)
    m = grid1.length
    n = grid1[0].length
    
    dfs = lambda do |i, j, is_valid|
        return [is_valid] if i < 0 || i >= m || j < 0 || j >= n
        is_valid = false if grid1[i][j] == 0
        grid2[i][j] = 0
        [[i+1, j], [i-1, j], [i, j+1], [i, j-1]].each do |r, c|
            if r >= 0 && r < m && c >= 0 && c < n && grid2[r][c] == 1
                is_valid = dfs.call(r, c, is_valid)[0]
            end
        end
        [is_valid]
    end
    
    res = 0
    (0...m).each do |i|
        (0...n).each do |j|
            if grid2[i][j] == 1
                is_valid = dfs.call(i, j, true)[0]
                res += 1 if is_valid
            end
        end
    end
    res
end

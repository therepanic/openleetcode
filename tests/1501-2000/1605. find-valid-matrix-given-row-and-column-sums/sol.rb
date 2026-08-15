# @param {Integer[]} row_sum
# @param {Integer[]} col_sum
# @return {Integer[][]}
def restore_matrix(row_sum, col_sum)
    m, n = row_sum.length, col_sum.length
    matrix = Array.new(m) { Array.new(n, 0) }
    i, j = 0, 0
    while i < m && j < n
        val = [row_sum[i], col_sum[j]].min
        matrix[i][j] = val
        row_sum[i] -= val
        col_sum[j] -= val
        i += 1 if row_sum[i] == 0
        j += 1 if col_sum[j] == 0
    end
    matrix
end

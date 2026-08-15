# @param {Integer[][]} mat
# @return {Integer}
def diagonal_sum(mat)
    summ = 0
    n = mat.length
    (0...n).each do |i|
        summ += mat[i][i]
        summ += mat[i][n - 1 - i]
    end
    summ -= mat[n / 2][n / 2] if n.odd?
    summ
end

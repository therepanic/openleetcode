# @param {Integer[][]} mat
# @param {Integer} k
# @return {Integer[][]}
def matrix_block_sum(mat, k)
    n, m = mat.length, mat[0].length
    pre = Array.new(n) { Array.new(m, 0) }
    ans = Array.new(n) { Array.new(m, 0) }
    
    (0...n).each do |i|
        (0...m).each do |j|
            _sum = mat[i][j]
            _sum += pre[i-1][j] if i-1 >= 0
            _sum += pre[i][j-1] if j-1 >= 0
            _sum -= pre[i-1][j-1] if i-1 >= 0 && j-1 >= 0
            pre[i][j] = _sum
        end
    end
    
    (0...n).each do |i|
        (0...m).each do |j|
            i1 = [0, i-k].max
            i2 = [n-1, i+k].min
            j1 = [0, j-k].max
            j2 = [m-1, j+k].min
            _sum = pre[i2][j2]
            _sum -= pre[i1-1][j2] if i1 - 1 >= 0
            _sum -= pre[i2][j1-1] if j1 - 1 >= 0
            _sum += pre[i1-1][j1-1] if i1 - 1 >= 0 && j1 - 1 >= 0
            ans[i][j] = _sum
        end
    end
    ans
end

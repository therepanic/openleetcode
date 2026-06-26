# @param {Integer[][]} mat
# @param {Integer} r
# @param {Integer} c
# @return {Integer[][]}
def matrix_reshape(mat, r, c)
    m = mat.length
    n = mat[0].length
    return mat if m * n != r * c
    
    reshaped = Array.new(r) { Array.new(c, 0) }
    count = 0
    
    (0...m).each do |i|
        (0...n).each do |j|
            reshaped[count / c][count % c] = mat[i][j]
            count += 1
        end
    end
    
    reshaped
end

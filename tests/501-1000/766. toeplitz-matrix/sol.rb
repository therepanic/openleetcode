# @param {Integer[][]} matrix
# @return {Boolean}
def is_toeplitz_matrix(matrix)
    n = matrix.length
    m = matrix[0].length
    
    (0...n - 1).each do |i|
        (0...m - 1).each do |j|
            if matrix[i][j] != matrix[i + 1][j + 1]
                return false
            end
        end
    end
    
    return true
end

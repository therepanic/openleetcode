# @param {Integer[][]} matrix
# @return {Integer}
def count_squares(matrix)
    return 0 if matrix.nil? || matrix.empty? || matrix[0].empty?
    
    m, n = matrix.length, matrix[0].length
    res = 0
    
    (0...m).each do |i|
        (0...n).each do |j|
            if matrix[i][j] == 1 && i > 0 && j > 0
                matrix[i][j] = [
                    matrix[i-1][j],
                    matrix[i][j-1],
                    matrix[i-1][j-1]
                ].min + 1
            end
            res += matrix[i][j]
        end
    end
    
    res
end

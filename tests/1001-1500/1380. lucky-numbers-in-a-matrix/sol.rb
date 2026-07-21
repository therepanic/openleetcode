# @param {Integer[][]} matrix
# @return {Integer[]}
def lucky_numbers(matrix)
    rows = matrix.length
    cols = matrix[0].length
    ans = []
    (0...rows).each do |i|
        (0...cols).each do |j|
            ele1 = (0...cols).map { |k| matrix[i][k] }.min
            ele2 = (0...rows).map { |k| matrix[k][j] }.max
            if ele1 == matrix[i][j] && ele2 == matrix[i][j]
                ans << matrix[i][j]
            end
        end
    end
    ans
end

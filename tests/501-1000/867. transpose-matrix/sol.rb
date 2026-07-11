# @param {Integer[][]} matrix
# @return {Integer[][]}
def transpose(matrix)
    row = matrix.length
    col = matrix[0].length
    trans = Array.new(col) { Array.new(row, 0) }

    (0...col).each do |i|
        (0...row).each do |j|
            trans[i][j] = matrix[j][i]
        end
    end

    trans
end

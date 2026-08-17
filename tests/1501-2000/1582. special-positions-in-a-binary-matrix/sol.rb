# @param {Integer[][]} mat
# @return {Integer}
def num_special(mat)
    m, n = mat.size, mat[0].size
    row = Array.new(m, 0)
    col = Array.new(n, 0)

    (0...m).each do |i|
        (0...n).each do |j|
            if mat[i][j] == 1
                row[i] += 1
                col[j] += 1
            end
        end
    end

    result = 0
    (0...m).each do |i|
        (0...n).each do |j|
            result += 1 if mat[i][j] == 1 && row[i] == 1 && col[j] == 1
        end
    end
    result
end

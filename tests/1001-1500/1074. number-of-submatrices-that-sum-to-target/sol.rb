# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Integer}
def num_submatrix_sum_target(matrix, target)
    m, n = matrix.length, matrix[0].length
    (0...m).each do |row|
        (1...n).each do |col|
            matrix[row][col] += matrix[row][col - 1]
        end
    end
    count = 0
    (0...n).each do |c1|
        (c1...n).each do |c2|
            prefix_sum_map = {0 => 1}
            sum_val = 0
            (0...m).each do |row|
                sum_val += matrix[row][c2] - (c1 > 0 ? matrix[row][c1 - 1] : 0)
                count += prefix_sum_map.fetch(sum_val - target, 0)
                prefix_sum_map[sum_val] = prefix_sum_map.fetch(sum_val, 0) + 1
            end
        end
    end
    count
end

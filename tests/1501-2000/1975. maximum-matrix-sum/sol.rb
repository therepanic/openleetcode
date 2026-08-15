# @param {Integer[][]} matrix
# @return {Integer}
def max_matrix_sum(matrix)
    total_sum = 0
    neg = 0
    min_abs = Float::INFINITY
    matrix.each do |row|
        row.each do |v|
            if v < 0
                neg += 1
            end
            av = v.abs
            total_sum += av
            min_abs = [min_abs, av].min
        end
    end
    neg.even? ? total_sum : total_sum - 2 * min_abs
end

# @param {Integer[][]} matrix
# @param {Integer} k
# @return {Integer}
def max_sum_submatrix(matrix, k)
    m = matrix.length
    n = matrix[0].length
    ans = -Float::INFINITY
    (0...n).each do |left|
        row_sum = Array.new(m, 0)
        (left...n).each do |right|
            (0...m).each do |i|
                row_sum[i] += matrix[i][right]
            end
            s = [0]
            curr = 0
            row_sum.each do |x|
                curr += x
                target = curr - k
                idx = s.bsearch_index { |val| val >= target } || s.length
                if idx < s.length
                    ans = [ans, curr - s[idx]].max
                end
                idx_insert = s.bsearch_index { |val| val >= curr } || s.length
                s.insert(idx_insert, curr)
            end
        end
    end
    ans
end

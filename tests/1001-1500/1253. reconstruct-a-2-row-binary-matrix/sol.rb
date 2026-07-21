# @param {Integer} upper
# @param {Integer} lower
# @param {Integer[]} colsum
# @return {Integer[][]}
def reconstruct_matrix(upper, lower, colsum)
    return [] if upper + lower != colsum.sum
    n = colsum.length
    res = Array.new(2) { Array.new(n, 0) }
    
    (0...n).each do |i|
        if colsum[i] == 2
            res[0][i] = 1
            res[1][i] = 1
            upper -= 1
            lower -= 1
        elsif colsum[i] == 1
            if upper > lower
                res[0][i] = 1
                upper -= 1
            else
                res[1][i] = 1
                lower -= 1
            end
        end
    end
    
    return res if lower == 0 && upper == 0
    []
end

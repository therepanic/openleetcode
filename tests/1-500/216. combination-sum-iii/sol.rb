# @param {Integer} k
# @param {Integer} n
# @return {Integer[][]}
def combination_sum3(k, n)
    res = []
    def backtrack(start, path, target, k, res)
        if target == 0 and k == 0
            res << path.dup
            return
        end
        (start..9).each do |i|
            break if i > target or k <= 0
            path << i
            backtrack(i+1, path, target - i, k - 1, res)
            path.pop
        end
    end
    backtrack(1, [], n, k, res)
    res
end

# @param {Integer} x
# @param {Integer} target
# @return {Integer}
def least_ops_express_target(x, target)
    $memo = {}
    
    def fn(val, x)
        return $memo[val] if $memo.key?(val)
        if val < x
            result = [2 * val - 1, 2 * (x - val)].min
            $memo[val] = result
            return result
        end
        k = Math.log(val, x).floor
        ans = k + fn(val - x ** k, x)
        if x ** (k + 1) < 2 * val
            ans = [ans, k + 1 + fn(x ** (k + 1) - val, x)].min
        end
        $memo[val] = ans
        return ans
    end
    
    return fn(target, x)
end

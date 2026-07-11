# @param {Integer} k
# @param {Integer} n
# @return {Integer}
def super_egg_drop(k, n)
    memo = {}
    
    solve = lambda do |eggs, floors|
        return floors if floors <= 1 || eggs == 1
        return memo[[eggs, floors]] if memo.key?([eggs, floors])
        
        low = 1
        high = floors
        ans = floors
        
        while low <= high
            mid = (low + high) / 2
            break_case = solve.call(eggs - 1, mid - 1)
            not_break_case = solve.call(eggs, floors - mid)
            
            ans = [ans, 1 + [break_case, not_break_case].max].min
            if break_case < not_break_case
                low = mid + 1
            else
                high = mid - 1
            end
        end
        
        memo[[eggs, floors]] = ans
        ans
    end
    
    solve.call(k, n)
end

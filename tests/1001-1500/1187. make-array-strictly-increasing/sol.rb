# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @return {Integer}
def make_array_increasing(arr1, arr2)
    arr2.sort!
    max_int = Float::INFINITY
    memo = {}
    
    dp = lambda do |i, prev_max|
        return 0 if i == arr1.length
        
        key = [i, prev_max]
        return memo[key] if memo.key?(key)
        
        j = arr2.bsearch_index { |x| x > prev_max }
        j = arr2.length if j.nil?
        
        ans = max_int
        if arr1[i] > prev_max
            ans = [ans, dp.call(i + 1, arr1[i])].min
        end
        if j < arr2.length
            ans = [ans, dp.call(i + 1, arr2[j]) + 1].min
        end
        
        memo[key] = ans
        ans
    end
    
    ops = dp.call(0, -Float::INFINITY)
    ops == max_int ? -1 : ops
end

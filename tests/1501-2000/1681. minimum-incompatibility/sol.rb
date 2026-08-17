# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def minimum_incompatibility(nums, k)
    n = nums.length
    sz = n / k
    
    counts = nums.tally
    return -1 if counts.any? { |_, v| v > k }
    
    nums.sort!
    
    valid_subsets = {}
    (0...(1 << n)).each do |mask|
        if mask.to_s(2).count('1') == sz
            subset = []
            (0...n).each do |i|
                subset << nums[i] if (mask >> i) & 1 == 1
            end
            if subset.uniq.length == sz
                valid_subsets[mask] = subset.max - subset.min
            end
        end
    end
    
    memo = {}
    solve = lambda do |remaining_mask|
        return 0 if remaining_mask == 0
        return memo[remaining_mask] if memo.key?(remaining_mask)
        
        res = Float::INFINITY
        first_element = (remaining_mask & -remaining_mask).bit_length - 1
        
        valid_subsets.each do |mask, cost|
            if (mask & remaining_mask) == mask && ((mask >> first_element) & 1) == 1
                res = [res, cost + solve.call(remaining_mask ^ mask)].min
            end
        end
        
        memo[remaining_mask] = res
        res
    end
    
    ans = solve.call((1 << n) - 1)
    ans == Float::INFINITY ? -1 : ans
end

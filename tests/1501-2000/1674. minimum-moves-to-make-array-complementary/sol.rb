# @param {Integer[]} nums
# @param {Integer} limit
# @return {Integer}
def min_moves(nums, limit)
    n = nums.length
    diff = Array.new(2 * limit + 2, 0)
    
    (0...(n / 2)).each do |i|
        a = nums[i]
        b = nums[n - 1 - i]
        low = [a, b].min + 1
        high = [a, b].max + limit
        total = a + b
        
        diff[2] += 2
        diff[2 * limit + 1] -= 2
        
        diff[low] -= 1
        diff[high + 1] += 1
        
        diff[total] -= 1
        diff[total + 1] += 1
    end
    
    ans = Float::INFINITY
    moves = 0
    (2..(2 * limit)).each do |target|
        moves += diff[target]
        ans = [ans, moves].min
    end
    
    ans
end

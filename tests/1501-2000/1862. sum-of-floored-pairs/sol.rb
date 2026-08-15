# @param {Integer[]} nums
# @return {Integer}
def sum_of_floored_pairs(nums)
    mod = 10**9 + 7
    maxi = 10**5 + 1
    max_val = nums.max
    size = 2 * maxi + 1
    freq = Array.new(size, 0)
    
    nums.each { |num| freq[num] += 1 }
    
    (1...size).each { |i| freq[i] += freq[i-1] }
    
    total = 0
    (1..max_val).each do |num|
        count_num = freq[num] - freq[num-1]
        next if count_num == 0
        floor_value = 1
        while floor_value * num <= max_val
            left = floor_value * num
            right = [(floor_value + 1) * num - 1, max_val].min
            count_in_range = freq[right] - freq[left - 1]
            total = (total + count_num * floor_value * count_in_range) % mod
            floor_value += 1
        end
    end
    total
end

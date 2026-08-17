# @param {Integer[]} nums
# @return {Integer}
def sum_of_beauties(nums)
    n = nums.length
    prefix = Array.new(n, 0)
    suffix = Array.new(n, 0)
    prefix[0] = nums[0]
    suffix[n-1] = nums[n-1]
    (1...n).each do |i|
        prefix[i] = [nums[i-1], prefix[i-1]].max
    end
    (n-2).downto(0) do |i|
        suffix[i] = [nums[i+1], suffix[i+1]].min
    end
    ans = 0
    (1...n-1).each do |i|
        if prefix[i] < nums[i] && nums[i] < suffix[i]
            ans += 2
        elsif nums[i-1] < nums[i] && nums[i] < nums[i+1]
            ans += 1
        end
    end
    ans
end

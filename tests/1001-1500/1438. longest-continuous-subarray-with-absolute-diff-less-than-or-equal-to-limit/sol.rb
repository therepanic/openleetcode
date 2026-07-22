# @param {Integer[]} nums
# @param {Integer} limit
# @return {Integer}
def longest_subarray(nums, limit)
    maxq = []
    minq = []
    left = 0
    max_len = 1
    nums.each_with_index do |num, right|
        while !maxq.empty? && nums[maxq.last] <= num
            maxq.pop
        end
        maxq.push(right)
        while !minq.empty? && nums[minq.last] >= num
            minq.pop
        end
        minq.push(right)
        while nums[maxq.first] - nums[minq.first] > limit
            left += 1
            maxq.shift if maxq.first < left
            minq.shift if minq.first < left
        end
        max_len = [max_len, right - left + 1].max
    end
    max_len
end

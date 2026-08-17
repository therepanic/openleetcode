# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def most_competitive(nums, k)
    stack = []
    n = nums.length
    (0...n).each do |i|
        while !stack.empty? && stack[-1] > nums[i]
            if (n - 1 - i) >= k - stack.length
                stack.pop
            else
                break
            end
        end
        stack << nums[i]
    end
    stack[0...k]
end

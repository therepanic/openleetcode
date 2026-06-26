# @param {Integer[]} nums
# @return {Integer}
def triangle_number(nums)
    nums.sort!
    n = nums.length
    count = 0
    (n - 1).downto(0) do |i|
        left = 0
        right = i - 1
        while left < right
            if nums[left] + nums[right] > nums[i]
                count += right - left
                right -= 1
            else
                left += 1
            end
        end
    end
    count
end

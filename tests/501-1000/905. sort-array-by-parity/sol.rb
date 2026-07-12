# @param {Integer[]} nums
# @return {Integer[]}
def sort_array_by_parity(nums)
    left = 0
    nums.each_with_index do |num, i|
        if num % 2 == 0
            nums[left], nums[i] = nums[i], nums[left]
            left += 1
        end
    end
    nums
end

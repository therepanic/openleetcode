# @param {Integer[]} nums
# @return {Boolean}
def check(nums)
    n = nums.length
    count = 0
    (0...n).each do |i|
        count += 1 if nums[i] > nums[(i + 1) % n]
    end
    count <= 1
end

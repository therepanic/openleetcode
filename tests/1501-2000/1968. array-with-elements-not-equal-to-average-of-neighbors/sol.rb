# @param {Integer[]} nums
# @return {Integer[]}
def rearrange_array(nums)
    nums.sort!
    res = Array.new(nums.length, 0)
    mid = (nums.length + 1) / 2
    res.each_index do |i|
        if i.even?
            res[i] = nums[i/2]
        else
            res[i] = nums[mid + (i-1)/2]
        end
    end
    res
end

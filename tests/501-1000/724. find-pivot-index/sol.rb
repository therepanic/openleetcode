# @param {Integer[]} nums
# @return {Integer}
def pivot_index(nums)
    total_sum = nums.sum
    l_sum = 0
    r_sum = total_sum
    nums.each_with_index do |num, i|
        r_sum -= num
        return i if l_sum == r_sum
        l_sum += num
    end
    -1
end

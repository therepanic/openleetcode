# @param {Integer[]} nums
# @return {Integer}
def find_middle_index(nums)
    total = nums.sum
    left_sum = 0
    right_sum = total
    
    nums.each_with_index do |num, i|
        right_sum -= num
        return i if left_sum == right_sum
        left_sum += num
    end
    
    -1
end

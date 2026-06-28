# @param {Integer[]} nums
# @return {Boolean}
def check_possibility(nums)
    cnt_violations = 0
    (1...nums.length).each do |i|
        if nums[i] < nums[i - 1]
            if cnt_violations == 1
                return false
            end
            cnt_violations += 1
            if i >= 2 && nums[i - 2] > nums[i]
                nums[i] = nums[i - 1]
            end
        end
    end
    return true
end

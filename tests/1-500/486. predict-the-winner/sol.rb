# @param {Integer[]} nums
# @return {Boolean}
def predict_the_winner(nums)
    helper = ->(left, right) {
        if left == right
            return nums[left]
        end
        return [nums[left] - helper.call(left + 1, right), nums[right] - helper.call(left, right - 1)].max
    }
    return helper.call(0, nums.length - 1) >= 0
end

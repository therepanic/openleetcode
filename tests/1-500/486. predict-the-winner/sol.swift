class Solution {
    func predictTheWinner(_ nums: [Int]) -> Bool {
        func helper(_ left: Int, _ right: Int) -> Int {
            if left == right {
                return nums[left]
            }
            return max(nums[left] - helper(left + 1, right), 
                      nums[right] - helper(left, right - 1))
        }
        return helper(0, nums.count - 1) >= 0
    }
}

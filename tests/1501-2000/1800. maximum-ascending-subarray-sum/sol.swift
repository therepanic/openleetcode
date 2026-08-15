class Solution {
    func maxAscendingSum(_ nums: [Int]) -> Int {
        var curr = nums[0], ans = nums[0]
        for i in 1..<nums.count {
            curr = nums[i] > nums[i-1] ? curr + nums[i] : nums[i]
            ans = max(ans, curr)
        }
        return ans
    }
}

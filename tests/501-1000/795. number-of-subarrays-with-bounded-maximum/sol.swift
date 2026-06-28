class Solution {
    func numSubarrayBoundedMax(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
        var res = 0, dp = 0, prev = -1
        for i in 0..<nums.count {
            if nums[i] < left && i > 0 {
                res += dp
            }
            if nums[i] > right {
                dp = 0
                prev = i
            }
            if left <= nums[i] && nums[i] <= right {
                dp = i - prev
                res += dp
            }
        }
        return res
    }
}

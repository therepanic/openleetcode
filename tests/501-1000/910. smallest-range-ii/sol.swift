class Solution {
    func smallestRangeII(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums.sorted()
        let n = nums.count
        var ans = nums[n - 1] - nums[0]
        for i in 0..<n-1 {
            let high = max(nums[n - 1] - k, nums[i] + k)
            let low = min(nums[0] + k, nums[i + 1] - k)
            ans = min(ans, high - low)
        }
        return ans
    }
}

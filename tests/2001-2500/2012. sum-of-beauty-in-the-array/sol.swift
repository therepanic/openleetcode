class Solution {
    func sumOfBeauties(_ nums: [Int]) -> Int {
        let n = nums.count
        var prefix = [Int](repeating: 0, count: n)
        var suffix = [Int](repeating: 0, count: n)
        prefix[0] = nums[0]
        suffix[n-1] = nums[n-1]
        for i in 1..<n {
            prefix[i] = max(nums[i-1], prefix[i-1])
        }
        for i in stride(from: n-2, through: 0, by: -1) {
            suffix[i] = min(nums[i+1], suffix[i+1])
        }
        var ans = 0
        for i in 1..<n-1 {
            if prefix[i] < nums[i] && nums[i] < suffix[i] {
                ans += 2
            } else if nums[i-1] < nums[i] && nums[i] < nums[i+1] {
                ans += 1
            }
        }
        return ans
    }
}

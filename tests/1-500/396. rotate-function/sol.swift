class Solution {
    func maxRotateFunction(_ nums: [Int]) -> Int {
        let n = nums.count
        var totalSum = 0
        var F = 0
        for i in 0..<n {
            totalSum += nums[i]
            F += i * nums[i]
        }
        var result = F
        for k in 1..<n {
            F = F + totalSum - n * nums[n - k]
            result = max(result, F)
        }
        return result
    }
}

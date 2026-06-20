class Solution {
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        var nums = nums.sorted()
        let n = nums.count
        var dp = Array(repeating: 1, count: n)
        var prev = Array(repeating: -1, count: n)
        var maxi = 0
        for i in 1..<n {
            for j in 0..<i {
                if nums[i] % nums[j] == 0 && dp[i] < dp[j] + 1 {
                    dp[i] = dp[j] + 1
                    prev[i] = j
                }
            }
            if dp[i] > dp[maxi] {
                maxi = i
            }
        }
        var res = [Int]()
        var i = maxi
        while i >= 0 {
            res.append(nums[i])
            i = prev[i]
        }
        return res.reversed()
    }
}

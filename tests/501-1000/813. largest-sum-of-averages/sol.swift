class Solution {
    func largestSumOfAverages(_ nums: [Int], _ k: Int) -> Double {
        let n = nums.count
        if k == 1 {
            return Double(nums.reduce(0, +)) / Double(n)
        }
        var pref = [Int](repeating: 0, count: n+1)
        for i in 0..<n {
            pref[i+1] = pref[i] + nums[i]
        }
        var dp = Array(repeating: Array(repeating: 0.0, count: k+1), count: n+1)
        for i in 1...n {
            dp[i][1] = Double(pref[i]) / Double(i)
        }
        for p in 2...k {
            for i in p...n {
                var best = 0.0
                for j in (p-1)..<i {
                    let val = dp[j][p-1] + Double(pref[i] - pref[j]) / Double(i - j)
                    if val > best { best = val }
                }
                dp[i][p] = best
            }
        }
        return dp[n][k]
    }
}

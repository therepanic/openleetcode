class Solution {
    func maxSumAfterPartitioning(_ arr: [Int], _ k: Int) -> Int {
        let n = arr.count
        var dp = [Int](repeating: 0, count: n + 1)
        for i in 1...n {
            var curr = 0
            for j in 1...k {
                if i < j { break }
                curr = max(curr, arr[i - j])
                dp[i] = max(dp[i], dp[i - j] + curr * j)
            }
        }
        return dp[n]
    }
}

class Solution {
    func new21Game(_ n: Int, _ k: Int, _ maxPts: Int) -> Double {
        if k == 0 || n >= k - 1 + maxPts {
            return 1.0
        }

        var dp = [Double](repeating: 0.0, count: maxPts)
        dp[0] = 1.0

        var windowSum = 1.0
        var result = 0.0

        for i in 1...n {
            let prob = windowSum / Double(maxPts)

            if i < k {
                windowSum += prob
            } else {
                result += prob
            }

            if i >= maxPts {
                windowSum -= dp[i % maxPts]
            }

            dp[i % maxPts] = prob
        }

        return result
    }
}

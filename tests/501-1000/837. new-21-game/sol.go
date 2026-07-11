func new21Game(n int, k int, maxPts int) float64 {
    if k == 0 || n >= k-1+maxPts {
        return 1.0
    }

    dp := make([]float64, maxPts)
    dp[0] = 1.0

    windowSum := 1.0
    result := 0.0

    for i := 1; i <= n; i++ {
        prob := windowSum / float64(maxPts)

        if i < k {
            windowSum += prob
        } else {
            result += prob
        }

        if i >= maxPts {
            windowSum -= dp[i%maxPts]
        }

        dp[i%maxPts] = prob
    }

    return result
}

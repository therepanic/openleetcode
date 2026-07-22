func stoneGameIII(stoneValue []int) string {
    n := len(stoneValue)
    dp := make([]int, 3)

    for i := n - 1; i >= 0; i-- {
        takeOne := stoneValue[i] - dp[(i+1)%3]

        takeTwo := int(-1e9)
        if i+1 < n {
            takeTwo = stoneValue[i] + stoneValue[i+1] - dp[(i+2)%3]
        }

        takeThree := int(-1e9)
        if i+2 < n {
            takeThree = stoneValue[i] + stoneValue[i+1] + stoneValue[i+2] - dp[(i+3)%3]
        }

        dp[i%3] = max(takeOne, max(takeTwo, takeThree))
    }

    value := dp[0]
    if value > 0 {
        return "Alice"
    } else if value < 0 {
        return "Bob"
    } else {
        return "Tie"
    }
}

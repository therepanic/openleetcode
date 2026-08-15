func canReach(s string, minJump int, maxJump int) bool {
    n := len(s)
    if s[n-1] == '1' {
        return false
    }

    dp := make([]bool, n)
    dp[0] = true

    reachable := 0

    for i := 1; i < n; i++ {
        if i >= minJump && dp[i-minJump] {
            reachable++
        }

        if i > maxJump && dp[i-maxJump-1] {
            reachable--
        }

        if reachable > 0 && s[i] == '0' {
            dp[i] = true
        }
    }

    return dp[n-1]
}

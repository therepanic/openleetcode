func numWays(words []string, target string) int {
    const MOD = 1000000007
    m := len(words[0])
    A := make([][]int, m)
    for i := range A {
        A[i] = make([]int, 26)
    }
    for _, word := range words {
        for j := 0; j < m; j++ {
            A[j][word[j]-'a']++
        }
    }
    dp := make([][]int, m)
    for i := range dp {
        dp[i] = make([]int, len(target))
        for j := range dp[i] {
            dp[i][j] = -1
        }
    }
    var F func(int, int) int
    F = func(i, j int) int {
        if j == len(target) {
            return 1
        }
        if i == m {
            return 0
        }
        if dp[i][j] != -1 {
            return dp[i][j]
        }
        count := F(i+1, j) % MOD
        count = (count + (A[i][target[j]-'a'] % MOD) * F(i+1, j+1) % MOD) % MOD
        dp[i][j] = count
        return count
    }
    return F(0, 0)
}

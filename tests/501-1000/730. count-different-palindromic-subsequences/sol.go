func countPalindromicSubsequences(s string) int {
    const MOD = 1000000007
    n := len(s)
    memo := make([][]int, n+1)
    for i := range memo {
        memo[i] = make([]int, n+1)
        for j := range memo[i] {
            memo[i][j] = -1
        }
    }
    
    var dp func(left, right int) int
    dp = func(left, right int) int {
        if left >= right {
            return 0
        }
        if memo[left][right] != -1 {
            return memo[left][right]
        }
        var res int64 = 0
        for _, ch := range "abcd" {
            l := -1
            for i := left; i < right; i++ {
                if s[i] == byte(ch) {
                    l = i
                    break
                }
            }
            if l == -1 {
                continue
            }
            r := -1
            for i := right - 1; i >= left; i-- {
                if s[i] == byte(ch) {
                    r = i
                    break
                }
            }
            if r == -1 {
                continue
            }
            if l == r {
                res += 1
            } else {
                res += int64(dp(l+1, r) + 2)
            }
        }
        res %= MOD
        memo[left][right] = int(res)
        return int(res)
    }
    
    return dp(0, n)
}

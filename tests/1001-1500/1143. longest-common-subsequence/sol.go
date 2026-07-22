func longestCommonSubsequence(text1 string, text2 string) int {
    m, n := len(text1), len(text2)
    memo := make([][]int, m)
    for i := range memo {
        memo[i] = make([]int, n)
        for j := range memo[i] {
            memo[i][j] = -1
        }
    }

    var solve func(int, int) int
    solve = func(i, j int) int {
        if i >= m || j >= n {
            return 0
        }
        if memo[i][j] != -1 {
            return memo[i][j]
        }
        if text1[i] == text2[j] {
            memo[i][j] = 1 + solve(i+1, j+1)
        } else {
            left := solve(i+1, j)
            right := solve(i, j+1)
            if left > right {
                memo[i][j] = left
            } else {
                memo[i][j] = right
            }
        }
        return memo[i][j]
    }

    return solve(0, 0)
}

func canEat(candiesCount []int, queries [][]int) []bool {
    n := len(candiesCount)
    m := len(queries)
    ans := make([]bool, m)
    psum := make([]int64, n+1)
    for i := 1; i <= n; i++ {
        psum[i] = psum[i-1] + int64(candiesCount[i-1])
    }
    for i := 0; i < m; i++ {
        t, day, cap := queries[i][0], int64(queries[i][1]), int64(queries[i][2])
        minDays := psum[t] / cap
        maxDays := psum[t+1] - 1
        ans[i] = minDays <= day && day <= maxDays
    }
    return ans
}

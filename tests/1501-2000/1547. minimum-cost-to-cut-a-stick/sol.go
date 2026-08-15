func minCost(n int, cuts []int) int {
    c := append(append([]int{}, cuts...), 0, n)
    sort.Ints(c)
    m := len(c)
    memo := make([][]int, m)
    for i := range memo {
        memo[i] = make([]int, m)
        for j := range memo[i] {
            memo[i][j] = -1
        }
    }
    return optimize(0, m-1, c, memo)
}

func optimize(i, j int, c []int, memo [][]int) int {
    if j-i <= 1 {
        return 0
    }
    if memo[i][j] != -1 {
        return memo[i][j]
    }
    res := int(^uint(0) >> 1) // max int
    for k := i+1; k < j; k++ {
        val := optimize(i, k, c, memo) + optimize(k, j, c, memo)
        if val < res {
            res = val
        }
    }
    memo[i][j] = res + (c[j] - c[i])
    return memo[i][j]
}

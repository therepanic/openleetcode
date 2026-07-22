func maxSizeSlices(slices []int) int {
    n := len(slices)
    m := n / 3

    dp := func(slicesSubset []int) int {
        k := len(slicesSubset)
        dpTable := make([][]int, k+1)
        for i := range dpTable {
            dpTable[i] = make([]int, m+1)
        }
        for i := 1; i <= k; i++ {
            for j := 1; j <= min(i, m); j++ {
                take := slicesSubset[i-1]
                if i > 1 { take += dpTable[i-2][j-1] }
                dpTable[i][j] = max(dpTable[i-1][j], take)
            }
        }
        return dpTable[k][m]
    }

    return max(dp(slices[:n-1]), dp(slices[1:]))
}

func min(a, b int) int {
    if a < b {
        return a
    }
    return b
}

func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}

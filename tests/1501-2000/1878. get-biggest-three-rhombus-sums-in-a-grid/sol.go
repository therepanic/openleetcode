func getBiggestThree(grid [][]int) []int {
    m := len(grid)
    n := len(grid[0])
    maxD := min(m, n) / 2
    result := []int{}
    for d := 0; d <= maxD; d++ {
        for i := d; i < m-d; i++ {
            for j := d; j < n-d; j++ {
                val := diamondSum(grid, i, j, d)
                if !contains(result, val) {
                    result = append(result, val)
                }
            }
        }
    }
    sort.Sort(sort.Reverse(sort.IntSlice(result)))
    if len(result) < 3 {
        return result
    }
    return result[:3]
}

func diamondSum(grid [][]int, i, j, d int) int {
    if d == 0 {
        return grid[i][j]
    }
    sum := 0
    for t := 0; t <= d; t++ {
        sum += grid[i-d+t][j+t]
    }
    for t := 1; t <= d; t++ {
        sum += grid[i+t][j+d-t]
    }
    for t := 1; t <= d; t++ {
        sum += grid[i+d-t][j-t]
    }
    for t := 1; t < d; t++ {
        sum += grid[i-t][j-d+t]
    }
    return sum
}

func contains(arr []int, x int) bool {
    for _, a := range arr {
        if a == x {
            return true
        }
    }
    return false
}

func min(a, b int) int {
    if a < b {
        return a
    }
    return b
}

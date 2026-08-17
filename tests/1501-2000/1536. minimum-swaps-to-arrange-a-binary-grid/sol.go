func minSwaps(grid [][]int) int {
    n := len(grid)
    zeros := make([]int, n)
    for i := 0; i < n; i++ {
        count := 0
        for j := n - 1; j >= 0; j-- {
            if grid[i][j] == 0 {
                count++
            } else {
                break
            }
        }
        zeros[i] = count
    }
    swaps := 0
    for i := 0; i < n; i++ {
        needed := n - i - 1
        j := i
        for j < n && zeros[j] < needed {
            j++
        }
        if j == n {
            return -1
        }
        for j > i {
            zeros[j], zeros[j-1] = zeros[j-1], zeros[j]
            j--
            swaps++
        }
    }
    return swaps
}

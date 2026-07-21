func shiftGrid(grid [][]int, k int) [][]int {
    m := len(grid)
    n := len(grid[0])
    total := m * n
    k %= total
    if k == 0 {
        return grid
    }
    
    lastKElements := make([]int, k)
    i := m - 1
    x := n - 1
    count := 0
    
    for count != k {
        lastKElements[count] = grid[i][x]
        if x >= 1 {
            x--
        } else {
            i--
            x = n - 1
        }
        count++
    }
    
    j := m - 1
    y := n - 1
    
    for i != 0 || x != -1 {
        if x == -1 {
            i--
            x = n - 1
        }
        if y == -1 {
            j--
            y = n - 1
        }
        grid[j][y] = grid[i][x]
        x--
        y--
    }
    
    idx := 0
    for k > 0 {
        if y == -1 {
            j--
            y = n - 1
        }
        grid[j][y] = lastKElements[idx]
        y--
        k--
        idx++
    }
    
    return grid
}

func latestDayToCross(row int, col int, cells [][]int) int {
    left, right := 1, len(cells)
    answer := 0
    for left <= right {
        mid := (left + right) / 2
        if canCross(mid, row, col, cells) {
            answer = mid
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return answer
}

func canCross(day int, row int, col int, cells [][]int) bool {
    grid := make([][]int, row)
    for i := range grid {
        grid[i] = make([]int, col)
    }
    for i := 0; i < day; i++ {
        r := cells[i][0] - 1
        c := cells[i][1] - 1
        grid[r][c] = 1
    }
    
    queueR := make([]int, 0, row*col)
    queueC := make([]int, 0, row*col)
    visited := make([][]bool, row)
    for i := range visited {
        visited[i] = make([]bool, col)
    }
    
    for c := 0; c < col; c++ {
        if grid[0][c] == 0 {
            queueR = append(queueR, 0)
            queueC = append(queueC, c)
            visited[0][c] = true
        }
    }
    
    dr := []int{1, -1, 0, 0}
    dc := []int{0, 0, 1, -1}
    head := 0
    for head < len(queueR) {
        r := queueR[head]
        c := queueC[head]
        head++
        if r == row-1 {
            return true
        }
        for k := 0; k < 4; k++ {
            nr := r + dr[k]
            nc := c + dc[k]
            if nr >= 0 && nr < row && nc >= 0 && nc < col && !visited[nr][nc] && grid[nr][nc] == 0 {
                visited[nr][nc] = true
                queueR = append(queueR, nr)
                queueC = append(queueC, nc)
            }
        }
    }
    return false
}

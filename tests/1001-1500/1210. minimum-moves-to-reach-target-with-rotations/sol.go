func minimumMoves(grid [][]int) int {
    n := len(grid)
    target := []int{n - 1, n - 2, 0}
    
    type state struct {
        r, c, o int
    }
    
    queue := []struct {
        s    state
        dist int
    }{{state{0, 0, 0}, 0}}
    
    visited := make([][][]bool, n)
    for i := range visited {
        visited[i] = make([][]bool, n)
        for j := range visited[i] {
            visited[i][j] = make([]bool, 2)
        }
    }
    visited[0][0][0] = true
    
    for len(queue) > 0 {
        curr := queue[0]
        queue = queue[1:]
        r, c, o := curr.s.r, curr.s.c, curr.s.o
        dist := curr.dist
        
        if r == target[0] && c == target[1] && o == target[2] {
            return dist
        }
        
        if o == 0 {
            if c + 2 < n && grid[r][c + 2] == 0 {
                if !visited[r][c + 1][0] {
                    visited[r][c + 1][0] = true
                    queue = append(queue, struct {
                        s    state
                        dist int
                    }{state{r, c + 1, 0}, dist + 1})
                }
            }
            if r + 1 < n && grid[r + 1][c] == 0 && grid[r + 1][c + 1] == 0 {
                if !visited[r + 1][c][0] {
                    visited[r + 1][c][0] = true
                    queue = append(queue, struct {
                        s    state
                        dist int
                    }{state{r + 1, c, 0}, dist + 1})
                }
            }
        } else {
            if c + 1 < n && grid[r][c + 1] == 0 && grid[r + 1][c + 1] == 0 {
                if !visited[r][c + 1][1] {
                    visited[r][c + 1][1] = true
                    queue = append(queue, struct {
                        s    state
                        dist int
                    }{state{r, c + 1, 1}, dist + 1})
                }
            }
            if r + 2 < n && grid[r + 2][c] == 0 {
                if !visited[r + 1][c][1] {
                    visited[r + 1][c][1] = true
                    queue = append(queue, struct {
                        s    state
                        dist int
                    }{state{r + 1, c, 1}, dist + 1})
                }
            }
        }
        
        if r + 1 < n && c + 1 < n &&
            grid[r + 1][c] == 0 && grid[r][c + 1] == 0 && grid[r + 1][c + 1] == 0 {
            newO := 1 - o
            if !visited[r][c][newO] {
                visited[r][c][newO] = true
                queue = append(queue, struct {
                    s    state
                    dist int
                }{state{r, c, newO}, dist + 1})
            }
        }
    }
    
    return -1
}

func orangesRotting(grid [][]int) int {
    n, m := len(grid), len(grid[0])
    type node struct {
        r, c, t int
    }
    q := []node{}
    fresh := 0

    for i := 0; i < n; i++ {
        for j := 0; j < m; j++ {
            if grid[i][j] == 2 {
                q = append(q, node{i, j, 0})
            } else if grid[i][j] == 1 {
                fresh++
            }
        }
    }

    directions := [][2]int{{-1,0},{1,0},{0,-1},{0,1}}
    maxTime, rotten := 0, 0

    for len(q) > 0 {
        cur := q[0]
        q = q[1:]
        r, c, t := cur.r, cur.c, cur.t
        if t > maxTime {
            maxTime = t
        }

        for _, dir := range directions {
            nr, nc := r+dir[0], c+dir[1]
            if nr >= 0 && nr < n && nc >= 0 && nc < m && grid[nr][nc] == 1 {
                grid[nr][nc] = 2
                q = append(q, node{nr, nc, t+1})
                rotten++
            }
        }
    }

    if rotten == fresh {
        return maxTime
    }
    return -1
}

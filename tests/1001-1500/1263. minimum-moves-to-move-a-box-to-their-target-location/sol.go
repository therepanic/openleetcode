func minPushBox(grid [][]byte) int {
    rows, cols := len(grid), len(grid[0])
    type pair struct{ x, y int }
    var player, box, target pair
    
    for i:=0; i<rows; i++ {
        for j:=0; j<cols; j++ {
            switch grid[i][j] {
            case 'S': player = pair{i, j}
            case 'B': box = pair{i, j}
            case 'T': target = pair{i, j}
            }
        }
    }
    
    dirs := []pair{{1,0}, {-1,0}, {0,1}, {0,-1}}
    type state struct {
        box, player pair
        pushes int
    }
    
    q := []state{{box, player, 0}}
    seen := make(map[[4]int]bool)
    seen[[4]int{box.x, box.y, player.x, player.y}] = true
    
    for len(q) > 0 {
        cur := q[0]
        q = q[1:]
        if cur.box == target {
            return cur.pushes
        }
        
        reachable := make(map[pair]bool)
        reachable[cur.player] = true
        walk := []pair{cur.player}
        for len(walk) > 0 {
            w := walk[0]
            walk = walk[1:]
            for _, d := range dirs {
                nx, ny := w.x+d.x, w.y+d.y
                np := pair{nx, ny}
                if nx >= 0 && nx < rows && ny >= 0 && ny < cols &&
                    np != cur.box && grid[nx][ny] != '#' && !reachable[np] {
                    reachable[np] = true
                    walk = append(walk, np)
                }
            }
        }
        
        for _, d := range dirs {
            nextBox := pair{cur.box.x+d.x, cur.box.y+d.y}
            behind := pair{cur.box.x-d.x, cur.box.y-d.y}
            if nextBox.x >= 0 && nextBox.x < rows && nextBox.y >= 0 && nextBox.y < cols &&
                grid[nextBox.x][nextBox.y] != '#' && reachable[behind] {
                key := [4]int{nextBox.x, nextBox.y, cur.box.x, cur.box.y}
                if !seen[key] {
                    seen[key] = true
                    q = append(q, state{nextBox, cur.box, cur.pushes+1})
                }
            }
        }
    }
    return -1
}

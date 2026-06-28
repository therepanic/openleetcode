func openLock(deadends []string, target string) int {
    if target == "0000" {
        return 0
    }
    dead := make(map[string]bool)
    for _, d := range deadends {
        dead[d] = true
    }
    if dead["0000"] {
        return -1
    }
    
    moves := 0
    queue := []string{"0000"}
    visited := map[string]bool{"0000": true}
    
    for len(queue) > 0 {
        size := len(queue)
        for k := 0; k < size; k++ {
            cur := queue[0]
            queue = queue[1:]
            if cur == target {
                return moves
            }
            for i := 0; i < 4; i++ {
                val := int(cur[i] - '0')
                up := (val + 1) % 10
                down := (val - 1 + 10) % 10
                
                nxt1 := cur[:i] + strconv.Itoa(up) + cur[i+1:]
                nxt2 := cur[:i] + strconv.Itoa(down) + cur[i+1:]
                
                if !dead[nxt1] && !visited[nxt1] {
                    visited[nxt1] = true
                    queue = append(queue, nxt1)
                }
                if !dead[nxt2] && !visited[nxt2] {
                    visited[nxt2] = true
                    queue = append(queue, nxt2)
                }
            }
        }
        moves++
    }
    return -1
}

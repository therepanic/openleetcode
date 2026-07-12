func isEscapePossible(blocked [][]int, source []int, target []int) bool {
    blockedSet := make(map[[2]int]bool)
    for _, b := range blocked {
        blockedSet[[2]int{b[0], b[1]}] = true
    }
    MAX := len(blocked) * len(blocked) / 2
    dirs := [][2]int{{-1, 0}, {1, 0}, {0, -1}, {0, 1}}

    bfs := func(start, end []int) bool {
        visited := make(map[[2]int]bool)
        queue := [][2]int{{start[0], start[1]}}
        visited[[2]int{start[0], start[1]}] = true
        count := 0

        for len(queue) > 0 {
            cur := queue[0]
            queue = queue[1:]
            x, y := cur[0], cur[1]
            if x == end[0] && y == end[1] {
                return true
            }
            if count > MAX {
                return true
            }

            for _, dir := range dirs {
                nx, ny := x+dir[0], y+dir[1]
                key := [2]int{nx, ny}
                if nx >= 0 && nx < 1000000 && ny >= 0 && ny < 1000000 && !visited[key] && !blockedSet[key] {
                    visited[key] = true
                    queue = append(queue, key)
                }
            }
            count++
        }
        return false
    }

    return bfs(source, target) && bfs(target, source)
}

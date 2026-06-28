func findRedundantConnection(edges [][]int) []int {
    n := len(edges)
    matrix := make([][]int, n+1)
    for i := range matrix {
        matrix[i] = []int{}
    }
    for _, edge := range edges {
        a, b := edge[0], edge[1]
        matrix[a] = append(matrix[a], b)
        matrix[b] = append(matrix[b], a)
    }

    visited := make(map[int]bool)
    path := make(map[int]bool)
    cycleStart := -1

    var dfs func(int, int) bool
    dfs = func(i, parent int) bool {
        if visited[i] {
            return false
        }
        visited[i] = true
        for _, node := range matrix[i] {
            if !visited[node] {
                if dfs(node, i) {
                    if cycleStart != -1 {
                        path[node] = true
                    }
                    if node == cycleStart {
                        cycleStart = -1
                    }
                    return true
                }
            } else if node != parent {
                path[node] = true
                cycleStart = node
                return true
            }
        }
        return false
    }

    for i := n; i >= 1; i-- {
        if dfs(i, -1) {
            break
        }
    }

    for k := n - 1; k >= 0; k-- {
        a, b := edges[k][0], edges[k][1]
        if path[a] && path[b] {
            return []int{a, b}
        }
    }
    return []int{}
}

func shortestAlternatingPaths(n int, redEdges [][]int, blueEdges [][]int) []int {
    ans := make([]int, n)
    for i := range ans {
        ans[i] = -1
    }
    
    type edge struct {
        v    int
        color int // 1-red, 2-blue
    }
    graph := make([][]edge, n)
    for _, e := range redEdges {
        graph[e[0]] = append(graph[e[0]], edge{e[1], 1})
    }
    for _, e := range blueEdges {
        graph[e[0]] = append(graph[e[0]], edge{e[1], 2})
    }
    
    type node struct {
        u     int
        prevColor int
    }
    q := []node{{0, 0}}
    step := 0
    
    for len(q) > 0 {
        size := len(q)
        for i := 0; i < size; i++ {
            cur := q[0]
            q = q[1:]
            if ans[cur.u] == -1 {
                ans[cur.u] = step
            }
            for j := range graph[cur.u] {
                e := graph[cur.u][j]
                if e.v == -1 || e.color == cur.prevColor {
                    continue
                }
                q = append(q, node{e.v, e.color})
                graph[cur.u][j].v = -1
            }
        }
        step++
    }
    return ans
}

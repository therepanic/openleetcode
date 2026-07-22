func shortestAlternatingPaths(n int, redEdges [][]int, blueEdges [][]int) []int {
    ans := make([]int, n)
    for i := range ans {
        ans[i] = -1
    }
    
    type edge struct {
        to   int
        color int // 1=red, 2=blue
    }
    
    graph := make([][]edge, n)
    for _, e := range redEdges {
        graph[e[0]] = append(graph[e[0]], edge{e[1], 1})
    }
    for _, e := range blueEdges {
        graph[e[0]] = append(graph[e[0]], edge{e[1], 2})
    }
    
    type pair struct {
        node      int
        prevColor int // 0=init
    }
    
    q := []pair{{0, 0}}
    step := 0
    
    for len(q) > 0 {
        size := len(q)
        for i := 0; i < size; i++ {
            u, prevColor := q[0].node, q[0].prevColor
            q = q[1:]
            if ans[u] == -1 {
                ans[u] = step
            }
            for j, e := range graph[u] {
                if e.to == -1 || e.color == prevColor {
                    continue
                }
                q = append(q, pair{e.to, e.color})
                graph[u][j].to = -1
            }
        }
        step++
    }
    return ans
}

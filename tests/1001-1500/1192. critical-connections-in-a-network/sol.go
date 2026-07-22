func criticalConnections(n int, connections [][]int) [][]int {
    graph := make([][]int, n)
    for _, edge := range connections {
        u, v := edge[0], edge[1]
        graph[u] = append(graph[u], v)
        graph[v] = append(graph[v], u)
    }
    
    disc := make([]int, n)
    low := make([]int, n)
    for i := range disc {
        disc[i] = -1
    }
    timer := 0
    bridges := make([][]int, 0)
    iterIdx := make([]int, n)
    
    for start := 0; start < n; start++ {
        if disc[start] != -1 {
            continue
        }
        
        type frame struct {
            node, parent int
        }
        stack := []frame{{start, -1}}
        disc[start] = timer
        low[start] = timer
        timer++
        
        for len(stack) > 0 {
            top := stack[len(stack)-1]
            node, parent := top.node, top.parent
            neighbors := graph[node]
            
            if iterIdx[node] < len(neighbors) {
                nb := neighbors[iterIdx[node]]
                iterIdx[node]++
                if nb == parent {
                    continue
                }
                
                if disc[nb] == -1 {
                    disc[nb] = timer
                    low[nb] = timer
                    timer++
                    stack = append(stack, frame{nb, node})
                } else {
                    if disc[nb] < low[node] {
                        low[node] = disc[nb]
                    }
                }
            } else {
                stack = stack[:len(stack)-1]
                if len(stack) > 0 {
                    par := stack[len(stack)-1].node
                    if low[node] < low[par] {
                        low[par] = low[node]
                    }
                    if low[node] > disc[par] {
                        bridges = append(bridges, []int{par, node})
                    }
                }
            }
        }
    }
    
    return bridges
}

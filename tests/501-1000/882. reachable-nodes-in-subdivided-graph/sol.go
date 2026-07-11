func reachableNodes(edges [][]int, maxMoves int, n int) int {
    graph := make([][][]int, n)
    for i := 0; i < n; i++ {
        graph[i] = make([][]int, 0)
    }
    dist := make([]int, n)
    for i := 0; i < n; i++ {
        dist[i] = maxMoves + 1
    }
    
    for _, edge := range edges {
        u, v, cnt := edge[0], edge[1], edge[2]
        graph[u] = append(graph[u], []int{v, cnt})
        graph[v] = append(graph[v], []int{u, cnt})
    }
    
    dijkstra := func() int {
        dist[0] = 0
        heap := &MinHeap{{0, 0}}
        heap.Init()
        
        for heap.Len() > 0 {
            curr := heap.Pop().([]int)
            d, u := curr[0], curr[1]
            
            if d > dist[u] {
                continue
            }
            if d > maxMoves {
                continue
            }
            
            for _, neighbor := range graph[u] {
                v, w := neighbor[0], neighbor[1]
                newDist := d + w + 1
                if newDist < dist[v] {
                    dist[v] = newDist
                    heap.Push([]int{newDist, v})
                }
            }
        }
        
        count := 0
        for _, d := range dist {
            if d <= maxMoves {
                count++
            }
        }
        return count
    }
    
    reachableNodes := dijkstra()
    reachableSubnodes := 0
    
    for _, edge := range edges {
        u, v, cnt := edge[0], edge[1], edge[2]
        a := 0
        if dist[u] <= maxMoves {
            a = min(maxMoves - dist[u], cnt)
        }
        b := 0
        if dist[v] <= maxMoves {
            b = min(maxMoves - dist[v], cnt)
        }
        reachableSubnodes += min(a + b, cnt)
    }
    
    return reachableNodes + reachableSubnodes
}

func min(a, b int) int {
    if a < b {
        return a
    }
    return b
}

type MinHeap [][]int

func (h MinHeap) Len() int           { return len(h) }
func (h MinHeap) Less(i, j int) bool { return h[i][0] < h[j][0] }
func (h MinHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }

func (h *MinHeap) Push(x interface{}) {
    *h = append(*h, x.([]int))
}

func (h *MinHeap) Pop() interface{} {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[0 : n-1]
    return x
}

func (h *MinHeap) Init() {
    n := h.Len()
    for i := n/2 - 1; i >= 0; i-- {
        h.down(i, n)
    }
}

func (h *MinHeap) down(i, n int) {
    for {
        j1 := 2*i + 1
        if j1 >= n {
            break
        }
        j := j1
        if j2 := j1 + 1; j2 < n && h.Less(j2, j1) {
            j = j2
        }
        if h.Less(i, j) {
            break
        }
        h.Swap(i, j)
        i = j
    }
}

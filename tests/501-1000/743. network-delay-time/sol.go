func networkDelayTime(times [][]int, n int, k int) int {
    adj := make([][][]int, n+1)
    for i := range adj {
        adj[i] = [][]int{}
    }
    for _, t := range times {
        u, v, w := t[0], t[1], t[2]
        adj[u] = append(adj[u], []int{v, w})
    }
    
    dist := make([]int, n+1)
    for i := range dist {
        dist[i] = math.MaxInt32
    }
    dist[k] = 0
    
    pq := &MinHeap{}
    heap.Init(pq)
    heap.Push(pq, [2]int{0, k})
    
    for pq.Len() > 0 {
        item := heap.Pop(pq).([2]int)
        dis, node := item[0], item[1]
        if dis > dist[node] {
            continue
        }
        for _, edge := range adj[node] {
            adjNode, wt := edge[0], edge[1]
            if dis+wt < dist[adjNode] {
                dist[adjNode] = dis + wt
                heap.Push(pq, [2]int{dist[adjNode], adjNode})
            }
        }
    }
    
    ans := 0
    for i := 1; i <= n; i++ {
        if dist[i] == math.MaxInt32 {
            return -1
        }
        if dist[i] > ans {
            ans = dist[i]
        }
    }
    return ans
}

type MinHeap [][2]int

func (h MinHeap) Len() int           { return len(h) }
func (h MinHeap) Less(i, j int) bool { return h[i][0] < h[j][0] }
func (h MinHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }

func (h *MinHeap) Push(x any) {
    *h = append(*h, x.([2]int))
}

func (h *MinHeap) Pop() any {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[0 : n-1]
    return x
}

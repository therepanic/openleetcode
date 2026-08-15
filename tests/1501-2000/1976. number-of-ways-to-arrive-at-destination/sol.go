type Item struct {
    dist int64
    node int
}

type PriorityQueue []Item

func (pq PriorityQueue) Len() int { return len(pq) }
func (pq PriorityQueue) Less(i, j int) bool { return pq[i].dist < pq[j].dist }
func (pq PriorityQueue) Swap(i, j int) { pq[i], pq[j] = pq[j], pq[i] }
func (pq *PriorityQueue) Push(x interface{}) { *pq = append(*pq, x.(Item)) }
func (pq *PriorityQueue) Pop() interface{} {
    old := *pq
    n := len(old)
    item := old[n-1]
    *pq = old[:n-1]
    return item
}

func countPaths(n int, roads [][]int) int {
    graph := make([][][2]int, n)
    for _, road := range roads {
        u, v, time := road[0], road[1], road[2]
        graph[u] = append(graph[u], [2]int{v, time})
        graph[v] = append(graph[v], [2]int{u, time})
    }
    
    dist := make([]int64, n)
    for i := range dist {
        dist[i] = int64(1<<62)
    }
    ways := make([]int, n)
    dist[0] = 0
    ways[0] = 1
    
    pq := &PriorityQueue{}
    heap.Init(pq)
    heap.Push(pq, Item{0, 0})
    
    MOD := int64(1_000_000_007)
    
    for pq.Len() > 0 {
        item := heap.Pop(pq).(Item)
        d := item.dist
        node := item.node
        
        if d > dist[node] {
            continue
        }
        
        for _, edge := range graph[node] {
            neighbor := edge[0]
            time := int64(edge[1])
            
            if dist[node] + time < dist[neighbor] {
                dist[neighbor] = dist[node] + time
                ways[neighbor] = ways[node]
                heap.Push(pq, Item{dist[neighbor], neighbor})
            } else if dist[node] + time == dist[neighbor] {
                ways[neighbor] = (ways[neighbor] + ways[node]) % int(MOD)
            }
        }
    }
    
    return ways[n-1]
}

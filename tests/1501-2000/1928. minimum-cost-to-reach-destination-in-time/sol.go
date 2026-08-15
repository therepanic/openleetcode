func minCost(maxTime int, edges [][]int, passingFees []int) int {
    n := len(passingFees)
    graph := make([][]int, n)
    for i := range graph {
        graph[i] = make([]int, 0)
    }
    // adjacency list: store pairs as [next, time]? Need better structure
    // using map from node to slice of [next, time]
    adj := make([][][2]int, n)
    for _, e := range edges {
        u, v, t := e[0], e[1], e[2]
        adj[u] = append(adj[u], [2]int{v, t})
        adj[v] = append(adj[v], [2]int{u, t})
    }
    times := make([]int, n)
    costs := make([]int, n)
    for i := range times {
        times[i] = maxTime + 1
        costs[i] = int(^uint(0) >> 1) // max int
    }
    times[0] = 0
    costs[0] = passingFees[0]
    // priority queue as slice, need custom heap, but for simplicity use sort each time? 
    // Given constraints small, we can use simple slice and sort
    type item struct {cost, time, city int}
    pq := []item{{passingFees[0], 0, 0}}
    for len(pq) > 0 {
        // find min
        minIdx := 0
        for i := 1; i < len(pq); i++ {
            if pq[i].cost < pq[minIdx].cost || (pq[i].cost == pq[minIdx].cost && pq[i].time < pq[minIdx].time) {
                minIdx = i
            }
        }
        cur := pq[minIdx]
        pq = append(pq[:minIdx], pq[minIdx+1:]...)
        cost, time, city := cur.cost, cur.time, cur.city
        if city == n-1 {
            return cost
        }
        for _, nb := range adj[city] {
            nxt, t := nb[0], nb[1]
            nt := time + t
            if nt > maxTime { continue }
            nc := cost + passingFees[nxt]
            if nc < costs[nxt] || nt < times[nxt] {
                costs[nxt] = nc
                times[nxt] = nt
                pq = append(pq, item{nc, nt, nxt})
            }
        }
    }
    return -1
}

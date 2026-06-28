func findRedundantDirectedConnection(edges [][]int) []int {
    n := len(edges)
    parent := make([]int, n+1)
    ufParent := make([]int, n+1)
    rank := make([]int, n+1)
    
    for i := 0; i <= n; i++ {
        ufParent[i] = i
    }
    
    var find func(int) int
    find = func(u int) int {
        if ufParent[u] != u {
            ufParent[u] = find(ufParent[u])
        }
        return ufParent[u]
    }
    
    union := func(u, v int) bool {
        pu, pv := find(u), find(v)
        if pu == pv {
            return false
        }
        if rank[pu] < rank[pv] {
            ufParent[pu] = pv
        } else if rank[pv] < rank[pu] {
            ufParent[pv] = pu
        } else {
            ufParent[pu] = pv
            rank[pv]++
        }
        return true
    }
    
    var candidate1, candidate2 []int
    
    for _, edge := range edges {
        u, v := edge[0], edge[1]
        if parent[v] != 0 {
            candidate1 = []int{parent[v], v}
            candidate2 = []int{u, v}
            break
        }
        parent[v] = u
    }
    
    for _, edge := range edges {
        u, v := edge[0], edge[1]
        if candidate2 != nil && u == candidate2[0] && v == candidate2[1] {
            continue
        }
        if !union(u, v) {
            if candidate1 != nil {
                return candidate1
            }
            return []int{u, v}
        }
    }
    
    return candidate2
}

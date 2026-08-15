func distanceLimitedPathsExist(n int, edgeList [][]int, queries [][]int) []bool {
    parent := make([]int, n)
    rank := make([]int, n)
    for i := 0; i < n; i++ {
        parent[i] = i
    }
    
    find := func(x int) int {
        for parent[x] != x {
            parent[x] = parent[parent[x]]
            x = parent[x]
        }
        return x
    }
    
    union := func(x, y int) {
        xroot := find(x)
        yroot := find(y)
        if xroot == yroot {
            return
        }
        if rank[xroot] < rank[yroot] {
            parent[xroot] = yroot
        } else if rank[xroot] > rank[yroot] {
            parent[yroot] = xroot
        } else {
            parent[yroot] = xroot
            rank[xroot]++
        }
    }
    
    // add index to queries
    queriesWithIdx := make([][]int, len(queries))
    for i, q := range queries {
        queriesWithIdx[i] = []int{q[0], q[1], q[2], i}
    }
    
    sort.Slice(queriesWithIdx, func(i, j int) bool {
        return queriesWithIdx[i][2] < queriesWithIdx[j][2]
    })
    sort.Slice(edgeList, func(i, j int) bool {
        return edgeList[i][2] < edgeList[j][2]
    })
    
    idx := 0
    res := make([]bool, len(queries))
    for _, q := range queriesWithIdx {
        for idx < len(edgeList) && edgeList[idx][2] < q[2] {
            union(edgeList[idx][0], edgeList[idx][1])
            idx++
        }
        if find(q[0]) == find(q[1]) {
            res[q[3]] = true
        }
    }
    return res
}

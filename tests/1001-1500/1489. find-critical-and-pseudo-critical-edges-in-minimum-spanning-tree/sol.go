func findCriticalAndPseudoCriticalEdges(n int, edges [][]int) [][]int {
    type UnionFind struct {
        parent []int
    }
    newUnionFind := func(n int) *UnionFind {
        parent := make([]int, n)
        for i := 0; i < n; i++ {
            parent[i] = i
        }
        return &UnionFind{parent}
    }
    var findParent func(uf *UnionFind, p int) int
    findParent = func(uf *UnionFind, p int) int {
        if uf.parent[p] == p {
            return p
        }
        uf.parent[p] = findParent(uf, uf.parent[p])
        return uf.parent[p]
    }
    union := func(uf *UnionFind, u, v int) {
        pu, pv := findParent(uf, u), findParent(uf, v)
        uf.parent[pu] = pv
    }

    findMST := func(block, e int) int {
        uf := newUnionFind(n)
        weight := 0
        if e != -1 {
            weight += edges[e][2]
            union(uf, edges[e][0], edges[e][1])
        }
        for i := 0; i < len(edges); i++ {
            if i == block {
                continue
            }
            if findParent(uf, edges[i][0]) == findParent(uf, edges[i][1]) {
                continue
            }
            union(uf, edges[i][0], edges[i][1])
            weight += edges[i][2]
        }
        for i := 0; i < n; i++ {
            if findParent(uf, i) != findParent(uf, 0) {
                return int(^uint(0) >> 1)
            }
        }
        return weight
    }

    for i := range edges {
        edges[i] = append(edges[i], i)
    }
    sort.Slice(edges, func(i, j int) bool {
        return edges[i][2] < edges[j][2]
    })
    mstwt := findMST(-1, -1)
    critical := []int{}
    pseudoCritical := []int{}
    for i := range edges {
        if mstwt < findMST(i, -1) {
            critical = append(critical, edges[i][3])
        } else if mstwt == findMST(-1, i) {
            pseudoCritical = append(pseudoCritical, edges[i][3])
        }
    }
    return [][]int{critical, pseudoCritical}
}

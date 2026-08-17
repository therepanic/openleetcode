func maxNumEdgesToRemove(n int, edges [][]int) int {
    sort.Slice(edges, func(i, j int) bool {
        return edges[i][0] > edges[j][0]
    })
    parentA := make([]int, n+1)
    parentB := make([]int, n+1)
    for i := range parentA {
        parentA[i] = i
        parentB[i] = i
    }
    rankA := make([]int, n+1)
    rankB := make([]int, n+1)

    var find func(parent []int, x int) int
    find = func(parent []int, x int) int {
        if parent[x] != x {
            parent[x] = find(parent, parent[x])
        }
        return parent[x]
    }

    union := func(parent []int, rank []int, x, y int) bool {
        rootX := find(parent, x)
        rootY := find(parent, y)
        if rootX == rootY {
            return false
        }
        if rank[rootX] < rank[rootY] {
            parent[rootX] = rootY
        } else if rank[rootX] > rank[rootY] {
            parent[rootY] = rootX
        } else {
            parent[rootX] = rootY
            rank[rootY]++
        }
        return true
    }

    removed := 0
    aliceEdges := 0
    bobEdges := 0
    for _, e := range edges {
        if e[0] == 3 {
            if union(parentA, rankA, e[1], e[2]) {
                union(parentB, rankB, e[1], e[2])
                aliceEdges++
                bobEdges++
            } else {
                removed++
            }
        } else if e[0] == 2 {
            if union(parentB, rankB, e[1], e[2]) {
                bobEdges++
            } else {
                removed++
            }
        } else {
            if union(parentA, rankA, e[1], e[2]) {
                aliceEdges++
            } else {
                removed++
            }
        }
    }
    if bobEdges == n-1 && aliceEdges == n-1 {
        return removed
    }
    return -1
}

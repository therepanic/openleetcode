func areConnected(n int, threshold int, queries [][]int) []bool {
    limit := n
    for _, q := range queries {
        if q[0] > limit {
            limit = q[0]
        }
        if q[1] > limit {
            limit = q[1]
        }
    }
    parent := make([]int, limit+1)
    rank := make([]int, limit+1)
    for i := 0; i <= limit; i++ {
        parent[i] = i
        rank[i] = 1
    }

    var find func(int) int
    find = func(x int) int {
        res := x
        for res != parent[res] {
            parent[res] = parent[parent[res]]
            res = parent[res]
        }
        return res
    }

    union := func(a, b int) bool {
        p1, p2 := find(a), find(b)
        if p1 == p2 {
            return false
        }
        if rank[p1] > rank[p2] {
            parent[p2] = p1
            rank[p1] += rank[p2]
        } else {
            parent[p1] = p2
            rank[p2] += rank[p1]
        }
        return true
    }

    for i := threshold + 1; i <= limit; i++ {
        for j := 2 * i; j <= limit; j += i {
            union(i, j)
        }
    }

    result := make([]bool, len(queries))
    for idx, q := range queries {
        result[idx] = find(q[0]) == find(q[1])
    }
    return result
}

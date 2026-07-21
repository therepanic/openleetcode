func makeConnected(n int, connections [][]int) int {
    if len(connections) < n-1 {
        return -1
    }

    parent := make([]int, n)
    size := make([]int, n)
    for i := 0; i < n; i++ {
        parent[i] = i
        size[i] = 1
    }

    var find func(int) int
    find = func(node int) int {
        if parent[node] != node {
            parent[node] = find(parent[node])
        }
        return parent[node]
    }

    union := func(u, v int) {
        pu := find(u)
        pv := find(v)
        if pu == pv {
            return
        }
        if size[pu] < size[pv] {
            parent[pu] = pv
            size[pv] += size[pu]
        } else {
            parent[pv] = pu
            size[pu] += size[pv]
        }
    }

    extra := 0
    for _, conn := range connections {
        u, v := conn[0], conn[1]
        if find(u) == find(v) {
            extra++
        } else {
            union(u, v)
        }
    }

    components := 0
    for i := 0; i < n; i++ {
        if find(i) == i {
            components++
        }
    }

    if extra >= components-1 {
        return components - 1
    }
    return -1
}

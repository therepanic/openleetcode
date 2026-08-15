func checkWays(pairs [][]int) int {
    graph := make(map[int]map[int]bool)
    for _, p := range pairs {
        if graph[p[0]] == nil { graph[p[0]] = make(map[int]bool) }
        if graph[p[1]] == nil { graph[p[1]] = make(map[int]bool) }
        graph[p[0]][p[1]] = true
        graph[p[1]][p[0]] = true
    }
    if len(graph) == 0 { return 0 }
    root := -1
    maxSize := -1
    for node, neighbors := range graph {
        if len(neighbors) > maxSize {
            maxSize = len(neighbors)
            root = node
        }
    }
    if len(graph[root]) != len(graph)-1 { return 0 }

    ans := 1
    for node, neighbors := range graph {
        if node == root { continue }
        parents := []int{}
        for cand := range neighbors {
            if len(graph[cand]) >= len(neighbors) {
                parents = append(parents, cand)
            }
        }
        if len(parents) == 0 { return 0 }
        parent := parents[0]
        for _, cand := range parents {
            if len(graph[cand]) < len(graph[parent]) { parent = cand }
        }
        union := make(map[int]bool)
        for k := range graph[parent] {
            union[k] = true
        }
        union[parent] = true
        for k := range neighbors {
            if !union[k] { return 0 }
        }
        if len(neighbors) == len(graph[parent]) { ans = 2 }
    }
    return ans
}

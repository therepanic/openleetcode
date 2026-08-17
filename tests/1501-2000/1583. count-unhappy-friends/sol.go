func unhappyFriends(n int, preferences [][]int, pairs [][]int) int {
    graph := make([]int, n)
    for _, p := range pairs {
        graph[p[0]] = p[1]
        graph[p[1]] = p[0]
    }

    rank := make([][]int, n)
    for i := range rank {
        rank[i] = make([]int, n)
        for j, e := range preferences[i] {
            rank[i][e] = j
        }
    }

    ans := 0
    for u := 0; u < n; u++ {
        v := graph[u]
        unhappy := false
        for _, a := range preferences[u] {
            if a == v {
                break
            }
            av := graph[a]
            if rank[a][u] < rank[a][av] {
                unhappy = true
                break
            }
        }
        if unhappy {
            ans++
        }
    }
    return ans
}

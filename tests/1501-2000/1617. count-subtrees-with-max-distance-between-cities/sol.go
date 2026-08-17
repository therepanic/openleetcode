func countSubgraphsForEachDiameter(n int, edges [][]int) []int {
    graph := make([][]int, n)
    for _, e := range edges {
        u := e[0] - 1
        v := e[1] - 1
        graph[u] = append(graph[u], v)
        graph[v] = append(graph[v], u)
    }
    answer := make([]int, n-1)
    for mask := 1; mask < (1 << n); mask++ {
        if bits.OnesCount(uint(mask)) <= 1 {
            continue
        }
        b := mask & -mask
        s := bits.TrailingZeros(uint(b))
        seen := make([]bool, n)
        seen[s] = true
        cnt := 1
        q := []int{s}
        for len(q) > 0 {
            u := q[0]
            q = q[1:]
            for _, v := range graph[u] {
                if ((mask >> v) & 1) == 1 && !seen[v] {
                    seen[v] = true
                    cnt++
                    q = append(q, v)
                }
            }
        }
        if cnt != bits.OnesCount(uint(mask)) {
            continue
        }
        bfs := func(start int) (int, int) {
            dist := make([]int, n)
            for i := range dist {
                dist[i] = -1
            }
            dist[start] = 0
            q := []int{start}
            last := start
            for len(q) > 0 {
                u := q[0]
                q = q[1:]
                last = u
                for _, v := range graph[u] {
                    if ((mask >> v) & 1) == 1 && dist[v] == -1 {
                        dist[v] = dist[u] + 1
                        q = append(q, v)
                    }
                }
            }
            return last, dist[last]
        }
        a, _ := bfs(s)
        _, d := bfs(a)
        if d >= 1 {
            answer[d-1]++
        }
    }
    return answer
}

func loudAndRich(richer [][]int, quiet []int) []int {
    n := len(quiet)
    graph := make([][]int, n)
    for _, pair := range richer {
        graph[pair[1]] = append(graph[pair[1]], pair[0])
    }
    
    answer := make([]int, n)
    for i := range answer {
        answer[i] = -1
    }
    
    var dfs func(int) int
    dfs = func(i int) int {
        if answer[i] != -1 {
            return answer[i]
        }
        answer[i] = i
        for _, nei := range graph[i] {
            item := dfs(nei)
            if quiet[item] < quiet[answer[i]] {
                answer[i] = item
            }
        }
        return answer[i]
    }
    
    for i := 0; i < n; i++ {
        dfs(i)
    }
    return answer
}

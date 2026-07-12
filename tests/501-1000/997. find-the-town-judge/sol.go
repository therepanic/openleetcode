func findJudge(n int, trust [][]int) int {
    indegree := make([]int, n+1)
    outdegree := make([]int, n+1)
    for _, edge := range trust {
        a, b := edge[0], edge[1]
        outdegree[a]++
        indegree[b]++
    }
    for i := 1; i <= n; i++ {
        if outdegree[i] == 0 && indegree[i] == n-1 {
            return i
        }
    }
    return -1
}

func removeStones(stones [][]int) int {
    n := len(stones)
    matrix := make([][]int, n)
    for i := 0; i < n; i++ {
        matrix[i] = []int{}
    }
    
    for i := 0; i < n; i++ {
        for j := i + 1; j < n; j++ {
            if stones[i][0] == stones[j][0] || stones[i][1] == stones[j][1] {
                matrix[i] = append(matrix[i], j)
                matrix[j] = append(matrix[j], i)
            }
        }
    }
    
    visited := make([]bool, n)
    components := 0
    
    var dfs func(int)
    dfs = func(idx int) {
        visited[idx] = true
        for _, nei := range matrix[idx] {
            if !visited[nei] {
                dfs(nei)
            }
        }
    }
    
    for i := 0; i < n; i++ {
        if !visited[i] {
            components++
            dfs(i)
        }
    }
    
    return n - components
}

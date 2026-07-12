func numSimilarGroups(strs []string) int {
    n := len(strs)
    
    checkSimilarity := func(str1, str2 string) bool {
        diff := 0
        for i := 0; i < len(str1); i++ {
            if str1[i] != str2[i] {
                diff++
            }
        }
        return diff == 0 || diff == 2
    }
    
    matrix := make([][]int, n)
    for i := 0; i < n; i++ {
        matrix[i] = make([]int, 0)
    }
    
    for i := 0; i < n; i++ {
        for j := 0; j < n; j++ {
            if checkSimilarity(strs[i], strs[j]) {
                matrix[i] = append(matrix[i], j)
                matrix[j] = append(matrix[j], i)
            }
        }
    }
    
    visited := make([]bool, n)
    var dfs func(int)
    dfs = func(node int) {
        if visited[node] {
            return
        }
        visited[node] = true
        for _, nei := range matrix[node] {
            if !visited[nei] {
                dfs(nei)
            }
        }
    }
    
    count := 0
    for start := 0; start < n; start++ {
        if !visited[start] {
            dfs(start)
            count++
        }
    }
    
    return count
}

func findTheCity(n int, edges [][]int, distanceThreshold int) int {
    const INF = int(1e9)
    matrix := make([][]int, n)
    for i := 0; i < n; i++ {
        matrix[i] = make([]int, n)
        for j := 0; j < n; j++ {
            matrix[i][j] = INF
        }
        matrix[i][i] = 0
    }
    
    for _, edge := range edges {
        u, v, w := edge[0], edge[1], edge[2]
        matrix[u][v] = w
        matrix[v][u] = w
    }
    
    for via := 0; via < n; via++ {
        for i := 0; i < n; i++ {
            for j := 0; j < n; j++ {
                if matrix[i][via] + matrix[via][j] < matrix[i][j] {
                    matrix[i][j] = matrix[i][via] + matrix[via][j]
                }
            }
        }
    }
    
    minReachable := n
    ans := -1
    
    for i := 0; i < n; i++ {
        count := 0
        for j := 0; j < n; j++ {
            if matrix[i][j] <= distanceThreshold {
                count++
            }
        }
        if count <= minReachable {
            minReachable = count
            ans = i
        }
    }
    
    return ans
}

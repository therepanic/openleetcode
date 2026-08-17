func maximalNetworkRank(n int, roads [][]int) int {
    a := make([][]int, n)
    for i := range a {
        a[i] = make([]int, n)
    }
    for _, road := range roads {
        a[road[0]][road[1]] = 1
        a[road[1]][road[0]] = 1
    }
    
    d := make([]int, n)
    for i := 0; i < n; i++ {
        sum := 0
        for j := 0; j < n; j++ {
            sum += a[i][j]
        }
        d[i] = sum
    }
    
    rank := make([][]int, n)
    for i := range rank {
        rank[i] = make([]int, n)
        for j := range rank[i] {
            if i == j {
                rank[i][j] = -1
            } else {
                rank[i][j] = d[i] + d[j] - a[i][j]
            }
        }
    }
    
    max := -1
    for i := 0; i < n; i++ {
        for j := 0; j < n; j++ {
            if rank[i][j] > max {
                max = rank[i][j]
            }
        }
    }
    return max
}

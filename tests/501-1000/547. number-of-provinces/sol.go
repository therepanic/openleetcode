func findCircleNum(isConnected [][]int) int {
    n := len(isConnected)
    visited := make([]bool, n)
    count := 0

    var dfs func(city int)
    dfs = func(city int) {
        for neighbor := 0; neighbor < n; neighbor++ {
            if isConnected[city][neighbor] == 1 && !visited[neighbor] {
                visited[neighbor] = true
                dfs(neighbor)
            }
        }
    }

    for city := 0; city < n; city++ {
        if !visited[city] {
            visited[city] = true
            dfs(city)
            count++
        }
    }

    return count
}

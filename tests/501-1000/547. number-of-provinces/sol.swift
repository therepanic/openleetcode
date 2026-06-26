class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        let n = isConnected.count
        var visited = Array(repeating: false, count: n)
        var count = 0

        func dfs(_ city: Int) {
            for neighbor in 0..<n {
                if isConnected[city][neighbor] == 1 && !visited[neighbor] {
                    visited[neighbor] = true
                    dfs(neighbor)
                }
            }
        }

        for city in 0..<n {
            if !visited[city] {
                visited[city] = true
                dfs(city)
                count += 1
            }
        }

        return count
    }
}

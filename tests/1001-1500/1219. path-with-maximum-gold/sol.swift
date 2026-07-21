class Solution {
    func getMaximumGold(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        
        var visited = Array(repeating: Array(repeating: false, count: m), count: n)
        let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
        
        func dfs(_ r: Int, _ c: Int) -> Int {
            var total = grid[r][c]
            visited[r][c] = true
            
            var curr = 0
            for (dr, dc) in directions {
                let nr = r + dr
                let nc = c + dc
                if nr >= 0 && nr < n && nc >= 0 && nc < m {
                    if grid[nr][nc] != 0 && !visited[nr][nc] {
                        let a = dfs(nr, nc)
                        curr = max(curr, a)
                    }
                }
            }
            total += curr
            visited[r][c] = false
            return total
        }
        
        var ans = 0
        for i in 0..<n {
            for j in 0..<m {
                if !visited[i][j] && grid[i][j] != 0 {
                    ans = max(ans, dfs(i, j))
                }
            }
        }
        return ans
    }
}

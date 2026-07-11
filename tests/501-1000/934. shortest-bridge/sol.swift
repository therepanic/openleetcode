class Solution {
    func shortestBridge(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let directions = [(-1, 0), (1, 0), (0, 1), (0, -1)]
        var visited = Array(repeating: Array(repeating: false, count: n), count: n)
        var q = [(Int, Int, Int)]()
        
        func dfs(_ r: Int, _ c: Int) {
            visited[r][c] = true
            for (dr, dc) in directions {
                let nr = r + dr, nc = c + dc
                if nr >= 0 && nr < n && nc >= 0 && nc < n && !visited[nr][nc] {
                    if grid[nr][nc] == 0 {
                        visited[nr][nc] = true
                        q.append((nr, nc, 1))
                    } else {
                        dfs(nr, nc)
                    }
                }
            }
        }
        
        var found = false
        for i in 0..<n {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    dfs(i, j)
                    found = true
                    break
                }
            }
            if found { break }
        }
        
        while !q.isEmpty {
            let (r, c, dist) = q.removeFirst()
            for (dr, dc) in directions {
                let nr = r + dr, nc = c + dc
                if nr >= 0 && nr < n && nc >= 0 && nc < n && !visited[nr][nc] {
                    if grid[nr][nc] == 1 { return dist }
                    visited[nr][nc] = true
                    q.append((nr, nc, dist + 1))
                }
            }
        }
        return 0
    }
}

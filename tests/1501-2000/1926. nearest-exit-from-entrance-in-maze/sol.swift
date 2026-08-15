class Solution {
    func nearestExit(_ maze: [[Character]], _ entrance: [Int]) -> Int {
        let n = maze.count
        let m = maze[0].count
        var visited = Array(repeating: Array(repeating: false, count: m), count: n)
        var q = [(Int, Int, Int)]()
        q.append((entrance[0], entrance[1], 0))
        visited[entrance[0]][entrance[1]] = true
        let dirs = [(-1,0),(1,0),(0,-1),(0,1)]
        
        while !q.isEmpty {
            let (r, c, dist) = q.removeFirst()
            for (dr, dc) in dirs {
                let nr = r + dr
                let nc = c + dc
                if nr >= 0 && nc >= 0 && nr < n && nc < m && !visited[nr][nc] && maze[nr][nc] == "." {
                    visited[nr][nc] = true
                    if nr == 0 || nc == 0 || nr == n-1 || nc == m-1 {
                        return dist + 1
                    }
                    q.append((nr, nc, dist+1))
                }
            }
        }
        return -1
    }
}

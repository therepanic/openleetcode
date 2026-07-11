class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        let n = grid.count
        
        if grid[0][0] == 1 || grid[n - 1][n - 1] == 1 {
            return -1
        }
        
        if n == 1 {
            return 1
        }
        
        var dist = Array(repeating: Array(repeating: Int.max, count: n), count: n)
        dist[0][0] = 1
        
        var q = [[0, 0, 1]]
        
        let directions = [
            [-1, 0], [-1, -1], [0, 1], [-1, 1],
            [1, 0], [1, -1], [0, -1], [1, 1]
        ]
        
        while !q.isEmpty {
            let curr = q.removeFirst()
            let r = curr[0], c = curr[1], dis = curr[2]
            
            for dir in directions {
                let nr = r + dir[0]
                let nc = c + dir[1]
                
                if nr >= 0 && nr < n && nc >= 0 && nc < n &&
                    grid[nr][nc] == 0 && dis + 1 < dist[nr][nc] {
                    
                    dist[nr][nc] = dis + 1
                    
                    if nr == n - 1 && nc == n - 1 {
                        return dis + 1
                    }
                    
                    q.append([nr, nc, dis + 1])
                }
            }
        }
        
        return -1
    }
}

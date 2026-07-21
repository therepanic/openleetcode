class Solution {
    func hasValidPath(_ grid: [[Int]]) -> Bool {
        let m = grid.count
        let n = grid[0].count
        
        let dir: [Int: [(Int, Int)]] = [
            1: [(0, -1), (0, 1)],
            2: [(-1, 0), (1, 0)],
            3: [(0, -1), (1, 0)],
            4: [(0, 1), (1, 0)],
            5: [(0, -1), (-1, 0)],
            6: [(0, 1), (-1, 0)]
        ]
        
        var vis = Array(repeating: Array(repeating: false, count: n), count: m)
        var q = [(0, 0)]
        vis[0][0] = true
        
        while !q.isEmpty {
            let (r, c) = q.removeFirst()
            
            if r == m - 1 && c == n - 1 {
                return true
            }
            
            for (dr, dc) in dir[grid[r][c]]! {
                let nr = r + dr
                let nc = c + dc
                
                if nr < 0 || nc < 0 || nr >= m || nc >= n || vis[nr][nc] {
                    continue
                }
                
                for (bdr, bdc) in dir[grid[nr][nc]]! {
                    if nr + bdr == r && nc + bdc == c {
                        vis[nr][nc] = true
                        q.append((nr, nc))
                    }
                }
            }
        }
        
        return false
    }
}

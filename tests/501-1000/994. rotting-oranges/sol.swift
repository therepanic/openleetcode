class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        let n = grid.count, m = grid[0].count
        var grid = grid
        var q: [(Int, Int, Int)] = []
        var fresh = 0

        for i in 0..<n {
            for j in 0..<m {
                if grid[i][j] == 2 {
                    q.append((i, j, 0))
                } else if grid[i][j] == 1 {
                    fresh += 1
                }
            }
        }

        let directions = [(-1,0),(1,0),(0,-1),(0,1)]
        var maxTime = 0, rotten = 0

        while !q.isEmpty {
            let (r, c, t) = q.removeFirst()
            if t > maxTime { maxTime = t }

            for (dr, dc) in directions {
                let nr = r + dr, nc = c + dc
                if nr >= 0 && nr < n && nc >= 0 && nc < m && grid[nr][nc] == 1 {
                    grid[nr][nc] = 2
                    q.append((nr, nc, t + 1))
                    rotten += 1
                }
            }
        }

        return rotten == fresh ? maxTime : -1
    }
}

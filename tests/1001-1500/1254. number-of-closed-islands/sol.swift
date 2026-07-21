class Solution {
    func closedIsland(_ grid: [[Int]]) -> Int {
        var grid = grid
        let m = grid.count, n = grid[0].count
        var res = 0
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 { continue }
                var stack = [(i, j)]
                grid[i][j] = 1
                var closed = true
                while !stack.isEmpty {
                    let (r, c) = stack.removeLast()
                    if r == 0 || c == 0 || r == m - 1 || c == n - 1 {
                        closed = false
                    }
                    let dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]
                    for (dr, dc) in dirs {
                        let nr = r + dr, nc = c + dc
                        if nr >= 0 && nr < m && nc >= 0 && nc < n && grid[nr][nc] == 0 {
                            grid[nr][nc] = 1
                            stack.append((nr, nc))
                        }
                    }
                }
                if closed { res += 1 }
            }
        }
        return res
    }
}

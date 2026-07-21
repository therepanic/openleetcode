class Solution {
    func maxDistance(_ grid: [[Int]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty {
            return -1
        }
        
        let n = grid.count
        var grid = grid
        var frontier: [(Int, Int)] = []
        
        for r in 0..<n {
            for c in 0..<n {
                if grid[r][c] == 1 {
                    frontier.append((r, c))
                }
            }
        }
        
        if frontier.isEmpty || frontier.count == n * n {
            return -1
        }
        
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        var distance = -1
        
        while !frontier.isEmpty {
            var nextFrontier: [(Int, Int)] = []
            distance += 1
            
            for (r, c) in frontier {
                for (dr, dc) in directions {
                    let nr = r + dr
                    let nc = c + dc
                    
                    if nr >= 0 && nr < n && nc >= 0 && nc < n && grid[nr][nc] == 0 {
                        grid[nr][nc] = 1
                        nextFrontier.append((nr, nc))
                    }
                }
            }
            
            frontier = nextFrontier
        }
        
        return distance
    }
}

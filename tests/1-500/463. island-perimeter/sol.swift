class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        var visited = Set<String>()
        
        var startR = -1, startC = -1
        outerLoop: for r in 0..<rows {
            for c in 0..<cols {
                if grid[r][c] == 1 {
                    startR = r
                    startC = c
                    break outerLoop
                }
            }
        }
        
        var queue = [[startR, startC]]
        visited.insert("\(startR),\(startC)")
        var perimeter = 0
        
        let dirs = [[-1,0],[1,0],[0,-1],[0,1]]
        
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            let r = curr[0], c = curr[1]
            
            for dir in dirs {
                let nr = r + dir[0]
                let nc = c + dir[1]
                
                if nr < 0 || nr >= rows || nc < 0 || nc >= cols || grid[nr][nc] == 0 {
                    perimeter += 1
                } else if !visited.contains("\(nr),\(nc)") {
                    visited.insert("\(nr),\(nc)")
                    queue.append([nr, nc])
                }
            }
        }
        
        return perimeter
    }
}

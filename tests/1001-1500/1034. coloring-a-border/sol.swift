class Solution {
    func colorBorder(_ grid: [[Int]], _ row: Int, _ col: Int, _ color: Int) -> [[Int]] {
        var grid = grid
        let rows = grid.count
        let cols = grid[0].count
        let startColor = grid[row][col]
        
        if startColor == color {
            return grid
        }
        
        var queue: [(Int, Int)] = [(row, col)]
        var visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
        visited[row][col] = true
        var borders: [(Int, Int)] = []
        
        let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        
        while !queue.isEmpty {
            let (r, c) = queue.removeFirst()
            var isBorder = false
            
            for (dr, dc) in dirs {
                let nr = r + dr
                let nc = c + dc
                
                if nr < 0 || nr >= rows || nc < 0 || nc >= cols {
                    isBorder = true
                } else if grid[nr][nc] != startColor {
                    isBorder = true
                } else if !visited[nr][nc] {
                    visited[nr][nc] = true
                    queue.append((nr, nc))
                }
            }
            
            if isBorder {
                borders.append((r, c))
            }
        }
        
        for (r, c) in borders {
            grid[r][c] = color
        }
        
        return grid
    }
}

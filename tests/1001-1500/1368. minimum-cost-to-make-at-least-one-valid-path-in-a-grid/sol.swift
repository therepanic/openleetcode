class Solution {
    func minCost(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var minCost = Array(repeating: Array(repeating: Int.max, count: n), count: m)
        minCost[0][0] = 0
        
        var deque: [(Int, Int)] = [(0, 0)]
        
        let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        
        while !deque.isEmpty {
            let (r, c) = deque.removeFirst()
            
            for (i, (dr, dc)) in directions.enumerated() {
                let nr = r + dr
                let nc = c + dc
                let cost = (grid[r][c] != i + 1) ? 1 : 0
                
                if nr >= 0 && nr < m && nc >= 0 && nc < n && minCost[r][c] + cost < minCost[nr][nc] {
                    minCost[nr][nc] = minCost[r][c] + cost
                    
                    if cost == 1 {
                        deque.append((nr, nc))
                    } else {
                        deque.insert((nr, nc), at: 0)
                    }
                }
            }
        }
        
        return minCost[m - 1][n - 1]
    }
}

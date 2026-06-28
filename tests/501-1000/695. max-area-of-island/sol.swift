class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        var visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
        var maxIsland = 0
        
        func dfs(_ r: Int, _ c: Int) -> Int {
            if r < 0 || r >= rows || c < 0 || c >= cols || visited[r][c] || grid[r][c] == 0 {
                return 0
            }
            
            visited[r][c] = true
            
            return 1 + dfs(r+1, c) + dfs(r-1, c) + dfs(r, c+1) + dfs(r, c-1)
        }
        
        for r in 0..<rows {
            for c in 0..<cols {
                if grid[r][c] == 1 && !visited[r][c] {
                    maxIsland = max(maxIsland, dfs(r, c))
                }
            }
        }
        
        return maxIsland
    }
}

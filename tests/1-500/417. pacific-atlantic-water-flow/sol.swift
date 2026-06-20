class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        if heights.isEmpty { return [] }
        let m = heights.count
        let n = heights[0].count
        let directions = [(1,0), (-1,0), (0,1), (0,-1)]
        
        var pacific = Array(repeating: Array(repeating: false, count: n), count: m)
        var atlantic = Array(repeating: Array(repeating: false, count: n), count: m)
        
        func dfs(_ i: Int, _ j: Int, _ visited: inout [[Bool]]) {
            visited[i][j] = true
            for (dx, dy) in directions {
                let x = i + dx, y = j + dy
                if x >= 0 && x < m && y >= 0 && y < n 
                    && !visited[x][y] && heights[x][y] >= heights[i][j] {
                    dfs(x, y, &visited)
                }
            }
        }
        
        for j in 0..<n { dfs(0, j, &pacific) }
        for i in 0..<m { dfs(i, 0, &pacific) }
        for j in 0..<n { dfs(m-1, j, &atlantic) }
        for i in 0..<m { dfs(i, n-1, &atlantic) }
        
        var result: [[Int]] = []
        for i in 0..<m {
            for j in 0..<n {
                if pacific[i][j] && atlantic[i][j] {
                    result.append([i, j])
                }
            }
        }
        return result
    }
}

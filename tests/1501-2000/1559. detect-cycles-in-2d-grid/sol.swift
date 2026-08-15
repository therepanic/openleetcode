class Solution {
    func containsCycle(_ grid: [[Character]]) -> Bool {
        let n = grid.count
        let m = grid[0].count
        var visited = Array(repeating: Array(repeating: false, count: m), count: n)
        let directions = [(-1,0), (1,0), (0,-1), (0,1)]
        
        for i in 0..<n {
            for j in 0..<m {
                if !visited[i][j] {
                    if bfs(i, j, grid, &visited, directions) { return true }
                }
            }
        }
        return false
    }
    
    private func bfs(_ startI: Int, _ startJ: Int, _ grid: [[Character]], _ visited: inout [[Bool]], _ directions: [(Int, Int)]) -> Bool {
        let n = grid.count
        let m = grid[0].count
        var queue = [(startI, startJ, -1, -1)]
        visited[startI][startJ] = true
        var head = 0
        
        while head < queue.count {
            let (x, y, px, py) = queue[head]
            head += 1
            
            for (dx, dy) in directions {
                let nx = x + dx, ny = y + dy
                if nx < 0 || ny < 0 || nx >= n || ny >= m { continue }
                if grid[nx][ny] != grid[x][y] { continue }
                if nx == px && ny == py { continue }
                if visited[nx][ny] { return true }
                visited[nx][ny] = true
                queue.append((nx, ny, x, y))
            }
        }
        return false
    }
}

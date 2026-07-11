class Solution {
    func numEnclaves(_ grid: [[Int]]) -> Int {
        var total = 0
        for row in grid {
            for val in row {
                total += val
            }
        }
        
        let m = grid.count
        let n = grid[0].count
        if m == 1 || n == 1 { return 0 }
        
        var q: [(Int, Int)] = []
        var seen: Set<[Int]> = []
        
        for i in 0..<n {
            if grid[0][i] == 1 {
                q.append((0, i))
                seen.insert([0, i])
            }
            if grid[m-1][i] == 1 {
                q.append((m-1, i))
                seen.insert([m-1, i])
            }
        }
        for i in 1..<m-1 {
            if grid[i][0] == 1 {
                q.append((i, 0))
                seen.insert([i, 0])
            }
            if grid[i][n-1] == 1 {
                q.append((i, n-1))
                seen.insert([i, n-1])
            }
        }
        
        let directions = [[0,1],[1,0],[0,-1],[-1,0]]
        var nextTotal = 0
        
        while !q.isEmpty {
            let (x, y) = q.removeFirst()
            nextTotal += 1
            
            for dir in directions {
                let nx = x + dir[0]
                let ny = y + dir[1]
                let key = [nx, ny]
                if nx >= 0 && nx < m && ny >= 0 && ny < n && grid[nx][ny] == 1 && !seen.contains(key) {
                    q.append((nx, ny))
                    seen.insert(key)
                }
            }
        }
        
        return total - nextTotal
    }
}

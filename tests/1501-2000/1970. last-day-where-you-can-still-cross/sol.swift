class Solution {
    func latestDayToCross(_ row: Int, _ col: Int, _ cells: [[Int]]) -> Int {
        var left = 1, right = cells.count, answer = 0
        while left <= right {
            let mid = (left + right) / 2
            if canCross(mid, row, col, cells) {
                answer = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return answer
    }
    
    func canCross(_ day: Int, _ row: Int, _ col: Int, _ cells: [[Int]]) -> Bool {
        var grid = [[Int]](repeating: [Int](repeating: 0, count: col), count: row)
        for i in 0..<day {
            let r = cells[i][0] - 1
            let c = cells[i][1] - 1
            grid[r][c] = 1
        }
        
        var queueR = [Int]()
        var queueC = [Int]()
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: col), count: row)
        
        for c in 0..<col {
            if grid[0][c] == 0 {
                queueR.append(0)
                queueC.append(c)
                visited[0][c] = true
            }
        }
        
        let dr = [1, -1, 0, 0]
        let dc = [0, 0, 1, -1]
        var head = 0
        while head < queueR.count {
            let r = queueR[head]
            let c = queueC[head]
            head += 1
            if r == row - 1 { return true }
            for k in 0..<4 {
                let nr = r + dr[k]
                let nc = c + dc[k]
                if nr >= 0 && nr < row && nc >= 0 && nc < col && !visited[nr][nc] && grid[nr][nc] == 0 {
                    visited[nr][nc] = true
                    queueR.append(nr)
                    queueC.append(nc)
                }
            }
        }
        return false
    }
}

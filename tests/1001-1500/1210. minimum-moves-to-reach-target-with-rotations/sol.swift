class Solution {
    func minimumMoves(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let target = (n - 1, n - 2, 0)
        
        var queue: [((Int, Int, Int), Int)] = [((0, 0, 0), 0)]
        var visited = Array(
            repeating: Array(
                repeating: [false, false],
                count: n
            ),
            count: n
        )
        visited[0][0][0] = true
        
        while !queue.isEmpty {
            let (state, dist) = queue.removeFirst()
            let (r, c, o) = state
            
            if r == target.0 && c == target.1 && o == target.2 {
                return dist
            }
            
            if o == 0 {
                if c + 2 < n && grid[r][c + 2] == 0 {
                    if !visited[r][c + 1][0] {
                        visited[r][c + 1][0] = true
                        queue.append(((r, c + 1, 0), dist + 1))
                    }
                }
                if r + 1 < n && grid[r + 1][c] == 0 && grid[r + 1][c + 1] == 0 {
                    if !visited[r + 1][c][0] {
                        visited[r + 1][c][0] = true
                        queue.append(((r + 1, c, 0), dist + 1))
                    }
                }
            } else {
                if c + 1 < n && grid[r][c + 1] == 0 && grid[r + 1][c + 1] == 0 {
                    if !visited[r][c + 1][1] {
                        visited[r][c + 1][1] = true
                        queue.append(((r, c + 1, 1), dist + 1))
                    }
                }
                if r + 2 < n && grid[r + 2][c] == 0 {
                    if !visited[r + 1][c][1] {
                        visited[r + 1][c][1] = true
                        queue.append(((r + 1, c, 1), dist + 1))
                    }
                }
            }
            
            if r + 1 < n && c + 1 < n &&
                grid[r + 1][c] == 0 && grid[r][c + 1] == 0 && grid[r + 1][c + 1] == 0 {
                let newO = 1 - o
                if !visited[r][c][newO] {
                    visited[r][c][newO] = true
                    queue.append(((r, c, newO), dist + 1))
                }
            }
        }
        
        return -1
    }
}

class Solution {
    func numIslands(_ grid: [[String]]) -> Int {
        var grid = grid
        let rows = grid.count
        let cols = grid[0].count
        var islands = 0
        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

        for r in 0..<rows {
            for c in 0..<cols {
                if grid[r][c] != "1" {
                    continue
                }
                islands += 1
                var queue: [(Int, Int)] = [(r, c)]
                var index = 0
                grid[r][c] = "0"
                while index < queue.count {
                    let (row, col) = queue[index]
                    index += 1
                    for (dr, dc) in directions {
                        let nr = row + dr
                        let nc = col + dc
                        if nr >= 0 && nr < rows && nc >= 0 && nc < cols && grid[nr][nc] == "1" {
                            grid[nr][nc] = "0"
                            queue.append((nr, nc))
                        }
                    }
                }
            }
        }

        return islands
    }
}

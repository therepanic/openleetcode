class Solution {
    func minPushBox(_ grid: [[Character]]) -> Int {
        let rows = grid.count, cols = grid[0].count
        var player = (0, 0), box = (0, 0), target = (0, 0)
        for i in 0..<rows {
            for j in 0..<cols {
                switch grid[i][j] {
                case "S": player = (i, j)
                case "B": box = (i, j)
                case "T": target = (i, j)
                default: break
                }
            }
        }
        
        let dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        var q = [(box, player, 0)]
        var seen: Set<[Int]> = [[box.0, box.1, player.0, player.1]]
        
        while !q.isEmpty {
            let (b, p, pushes) = q.removeFirst()
            if b == target { return pushes }
            
            var reachable: Set<[Int]> = [[p.0, p.1]]
            var walk = [p]
            while !walk.isEmpty {
                let (x, y) = walk.removeFirst()
                for (dx, dy) in dirs {
                    let nx = x + dx, ny = y + dy
                    if nx >= 0 && nx < rows && ny >= 0 && ny < cols &&
                        !(nx == b.0 && ny == b.1) && grid[nx][ny] != "#" &&
                        !reachable.contains([nx, ny]) {
                        reachable.insert([nx, ny])
                        walk.append((nx, ny))
                    }
                }
            }
            
            for (dx, dy) in dirs {
                let nextBox = (b.0 + dx, b.1 + dy)
                let behind = (b.0 - dx, b.1 - dy)
                if nextBox.0 >= 0 && nextBox.0 < rows && nextBox.1 >= 0 && nextBox.1 < cols &&
                    grid[nextBox.0][nextBox.1] != "#" &&
                    reachable.contains([behind.0, behind.1]) &&
                    !seen.contains([nextBox.0, nextBox.1, b.0, b.1]) {
                    seen.insert([nextBox.0, nextBox.1, b.0, b.1])
                    q.append((nextBox, b, pushes + 1))
                }
            }
        }
        return -1
    }
}

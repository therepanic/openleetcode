class Solution {
    func shortestPathAllKeys(_ grid: [String]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var start_i = 0, start_j = 0
        var total_keys = 0
        
        let gridArray = grid.map { Array($0) }
        
        for i in 0..<m {
            for j in 0..<n {
                if gridArray[i][j] == "@" {
                    start_i = i
                    start_j = j
                }
                if gridArray[i][j] >= "a" && gridArray[i][j] <= "f" {
                    total_keys += 1
                }
            }
        }
        
        let target_mask = (1 << total_keys) - 1
        var queue: [(Int, Int, Int)] = [(start_i, start_j, 0)]
        var seen: [[[Bool]]] = Array(repeating: Array(repeating: Array(repeating: false, count: 1 << total_keys), count: n), count: m)
        seen[start_i][start_j][0] = true
        var moves = 0
        let dirs = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        
        while !queue.isEmpty {
            let size = queue.count
            for _ in 0..<size {
                let (r, c, mask) = queue.removeFirst()
                
                if mask == target_mask {
                    return moves
                }
                
                for (dx, dy) in dirs {
                    let nr = r + dx
                    let nc = c + dy
                    
                    if nr < 0 || nr >= m || nc < 0 || nc >= n {
                        continue
                    }
                    
                    let next_val = gridArray[nr][nc]
                    var next_mask = mask
                    
                    if next_val >= "a" && next_val <= "f" {
                        let key_bit = Int(next_val.asciiValue! - Character("a").asciiValue!)
                        next_mask |= (1 << key_bit)
                    }
                    
                    if next_val >= "A" && next_val <= "F" {
                        let lock_bit = Int(next_val.lowercased().first!.asciiValue! - Character("a").asciiValue!)
                        if (next_mask & (1 << lock_bit)) == 0 {
                            continue
                        }
                    }
                    
                    if !seen[nr][nc][next_mask] && next_val != "#" {
                        queue.append((nr, nc, next_mask))
                        seen[nr][nc][next_mask] = true
                    }
                }
            }
            moves += 1
        }
        
        return -1
    }
}

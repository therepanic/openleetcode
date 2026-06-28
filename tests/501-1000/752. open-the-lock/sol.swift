class Solution {
    func openLock(_ deadends: [String], _ target: String) -> Int {
        if target == "0000" { return 0 }
        let dead = Set(deadends)
        if dead.contains("0000") { return -1 }
        
        var moves = 0
        var queue = ["0000"]
        var visited: Set<String> = ["0000"]
        
        while !queue.isEmpty {
            let size = queue.count
            for _ in 0..<size {
                let cur = queue.removeFirst()
                if cur == target { return moves }
                
                for i in 0..<4 {
                    let idx = cur.index(cur.startIndex, offsetBy: i)
                    let val = Int(String(cur[idx]))!
                    let up = (val + 1) % 10
                    let down = (val - 1 + 10) % 10
                    
                    let nxt1 = String(cur[..<idx]) + String(up) + String(cur[cur.index(after: idx)...])
                    let nxt2 = String(cur[..<idx]) + String(down) + String(cur[cur.index(after: idx)...])
                    
                    if !dead.contains(nxt1) && !visited.contains(nxt1) {
                        visited.insert(nxt1)
                        queue.append(nxt1)
                    }
                    if !dead.contains(nxt2) && !visited.contains(nxt2) {
                        visited.insert(nxt2)
                        queue.append(nxt2)
                    }
                }
            }
            moves += 1
        }
        return -1
    }
}

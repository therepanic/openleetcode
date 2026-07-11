class Solution {
    func shortestPathLength(_ graph: [[Int]]) -> Int {
        let n = graph.count
        if n == 1 { return 0 }
        
        let FULL = (1 << n) - 1
        var visited = Array(repeating: Array(repeating: false, count: 1 << n), count: n)
        var queue = [(Int, Int, Int)]()
        
        for i in 0..<n {
            let mask = 1 << i
            queue.append((i, mask, 0))
            visited[i][mask] = true
        }
        
        var idx = 0
        while idx < queue.count {
            let (node, mask, dist) = queue[idx]
            idx += 1
            
            if mask == FULL { return dist }
            
            for nei in graph[node] {
                let newMask = mask | (1 << nei)
                
                if !visited[nei][newMask] {
                    visited[nei][newMask] = true
                    queue.append((nei, newMask, dist + 1))
                }
            }
        }
        
        return -1
    }
}

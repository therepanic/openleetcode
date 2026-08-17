import Foundation

class Solution {
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        let n = points.count
        var minCost = 0
        var visited = [Bool](repeating: false, count: n)
        var pq = [(0, 0)]
        var cache = [0: 0]
        
        while !pq.isEmpty {
            pq.sort { $0.0 < $1.0 }
            let (cost, u) = pq.removeFirst()
            if visited[u] { continue }
            visited[u] = true
            minCost += cost
            for v in 0..<n {
                if !visited[v] {
                    let dist = abs(points[u][0] - points[v][0]) + abs(points[u][1] - points[v][1])
                    if dist < (cache[v] ?? Int.max) {
                        cache[v] = dist
                        pq.append((dist, v))
                    }
                }
            }
        }
        return minCost
    }
}

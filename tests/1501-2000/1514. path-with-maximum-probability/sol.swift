class Solution {
    func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start_node: Int, _ end_node: Int) -> Double {
        var dist = Array(repeating: 0.0, count: n)
        dist[start_node] = 1.0
        
        for _ in 0..<(n - 1) {
            var updated = false
            for i in 0..<edges.count {
                let u = edges[i][0]
                let v = edges[i][1]
                if dist[u] * succProb[i] > dist[v] {
                    dist[v] = dist[u] * succProb[i]
                    updated = true
                }
                if dist[v] * succProb[i] > dist[u] {
                    dist[u] = dist[v] * succProb[i]
                    updated = true
                }
            }
            if !updated { break }
        }
        
        return dist[end_node]
    }
}

class Solution {
    func isBipartite(_ graph: [[Int]]) -> Bool {
        let N = graph.count
        var colors = [Int](repeating: -1, count: N)
        
        func checkBipartite(_ u: Int, _ currColor: Int) -> Bool {
            colors[u] = currColor
            for v in graph[u] {
                if colors[v] == -1 {
                    if !checkBipartite(v, 1 - currColor) {
                        return false
                    }
                } else {
                    if colors[v] == currColor {
                        return false
                    }
                }
            }
            return true
        }
        
        for u in 0..<N {
            if colors[u] == -1 {
                if !checkBipartite(u, 0) {
                    return false
                }
            }
        }
        return true
    }
}

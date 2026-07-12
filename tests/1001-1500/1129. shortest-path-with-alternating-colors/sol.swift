class Solution {
    func shortestAlternatingPaths(_ n: Int, _ redEdges: [[Int]], _ blueEdges: [[Int]]) -> [Int] {
        var ans = Array(repeating: -1, count: n)
        var graph = Array(repeating: [(Int, Int)](), count: n)
        var q: [(Int, Int)] = [(0, 0)]  // (node, prevColor): 0-init, 1-red, 2-blue
        
        for edge in redEdges {
            graph[edge[0]].append((edge[1], 1))
        }
        for edge in blueEdges {
            graph[edge[0]].append((edge[1], 2))
        }
        
        var step = 0
        while !q.isEmpty {
            let size = q.count
            for _ in 0..<size {
                let (u, prevColor) = q.removeFirst()
                if ans[u] == -1 {
                    ans[u] = step
                }
                for i in 0..<graph[u].count {
                    let (v, edgeColor) = graph[u][i]
                    if v == -1 || edgeColor == prevColor { continue }
                    q.append((v, edgeColor))
                    graph[u][i] = (-1, edgeColor)
                }
            }
            step += 1
        }
        return ans
    }
}

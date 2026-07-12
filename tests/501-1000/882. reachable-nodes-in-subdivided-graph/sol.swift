class Solution {
    func reachableNodes(_ edges: [[Int]], _ maxMoves: Int, _ n: Int) -> Int {
        var graph = Array(repeating: [(Int, Int)](), count: n)
        var dist = Array(repeating: maxMoves + 1, count: n)
        
        for edge in edges {
            let u = edge[0], v = edge[1], cnt = edge[2]
            graph[u].append((v, cnt))
            graph[v].append((u, cnt))
        }
        
        func dijkstra() -> Int {
            dist[0] = 0
            var heap = [(0, 0)]
            
            while !heap.isEmpty {
                heap.sort { $0.0 > $1.0 }
                let (d, u) = heap.removeLast()
                
                if dist[u] >= maxMoves {
                    break
                }
                
                for (v, w) in graph[u] {
                    let newDist = d + w + 1
                    if newDist < dist[v] {
                        dist[v] = newDist
                        heap.append((newDist, v))
                    }
                }
            }
            
            return dist.filter { $0 <= maxMoves }.count
        }
        
        let reachableNodes = dijkstra()
        var reachableSubnodes = 0
        
        for edge in edges {
            let u = edge[0], v = edge[1], cnt = edge[2]
            let a = dist[u] > maxMoves ? 0 : min(maxMoves - dist[u], cnt)
            let b = dist[v] > maxMoves ? 0 : min(maxMoves - dist[v], cnt)
            reachableSubnodes += min(a + b, cnt)
        }
        
        return reachableNodes + reachableSubnodes
    }
}

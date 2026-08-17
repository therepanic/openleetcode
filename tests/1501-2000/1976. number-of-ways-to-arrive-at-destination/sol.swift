class Solution {
    func countPaths(_ n: Int, _ roads: [[Int]]) -> Int {
        var graph = [[(neighbor: Int, time: Int)]](repeating: [], count: n)
        for road in roads {
            let u = road[0], v = road[1], time = road[2]
            graph[u].append((neighbor: v, time: time))
            graph[v].append((neighbor: u, time: time))
        }
        
        var dist = [Int](repeating: Int.max, count: n)
        var ways = [Int](repeating: 0, count: n)
        dist[0] = 0
        ways[0] = 1
        
        var pq = [(0, 0)]
        
        let MOD = 1_000_000_007
        
        while !pq.isEmpty {
            pq.sort { $0.0 < $1.0 }
            let (d, node) = pq.removeFirst()
            
            if d > dist[node] { continue }
            
            for edge in graph[node] {
                let neighbor = edge.neighbor
                let time = edge.time
                
                if dist[node] + time < dist[neighbor] {
                    dist[neighbor] = dist[node] + time
                    ways[neighbor] = ways[node]
                    pq.append((dist[neighbor], neighbor))
                } else if dist[node] + time == dist[neighbor] {
                    ways[neighbor] = (ways[neighbor] + ways[node]) % MOD
                }
            }
        }
        
        return ways[n-1]
    }
}

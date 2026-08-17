class Solution {
    func countRestrictedPaths(_ n: Int, _ edges: [[Int]]) -> Int {
        let mod = 1_000_000_007
        var graph = [[(Int, Int)]](repeating: [], count: n + 1)
        for e in edges {
            graph[e[0]].append((e[1], e[2]))
            graph[e[1]].append((e[0], e[2]))
        }

        var dist = [Int](repeating: Int.max, count: n + 1)
        dist[n] = 0
        var heap = [(Int, Int)]()
        heap.append((0, n))
        while !heap.isEmpty {
            let sorted = heap.sorted { $0.0 < $1.0 }
            heap = sorted
            let (d, node) = heap.removeFirst()
            if d > dist[node] { continue }
            for (next, w) in graph[node] {
                let nd = d + w
                if nd < dist[next] {
                    dist[next] = nd
                    heap.append((nd, next))
                }
            }
        }

        var dp = [Int](repeating: 0, count: n + 1)
        dp[n] = 1
        let nodes = (1...n).sorted { dist[$0] < dist[$1] }
        for u in nodes {
            for (v, _) in graph[u] {
                if dist[u] > dist[v] {
                    dp[u] = (dp[u] + dp[v]) % mod
                }
            }
        }
        return dp[1]
    }
}

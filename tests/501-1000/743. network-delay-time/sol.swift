class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var graph = Array(repeating: [(Int, Int)](), count: n + 1)
        for edge in times {
            graph[edge[0]].append((edge[1], edge[2]))
        }

        let inf = 1 << 60
        var dist = Array(repeating: inf, count: n + 1)
        var used = Array(repeating: false, count: n + 1)
        dist[k] = 0

        for _ in 0..<n {
            var node = -1
            for i in 1...n {
                if !used[i] && (node == -1 || dist[i] < dist[node]) {
                    node = i
                }
            }
            if node == -1 || dist[node] == inf {
                break
            }
            used[node] = true
            for (v, w) in graph[node] {
                if dist[node] + w < dist[v] {
                    dist[v] = dist[node] + w
                }
            }
        }

        var ans = 0
        for i in 1...n {
            if dist[i] == inf { return -1 }
            ans = max(ans, dist[i])
        }
        return ans
    }
}

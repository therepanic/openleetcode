class Solution {
    func minTrioDegree(_ n: Int, _ edges: [[Int]]) -> Int {
        var adj = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
        var deg = Array(repeating: 0, count: n+1)
        for e in edges {
            adj[e[0]][e[1]] = 1
            adj[e[1]][e[0]] = 1
            deg[e[0]] += 1
            deg[e[1]] += 1
        }
        var ans = Int.max
        for e in edges {
            let u = e[0], v = e[1]
            for w in 1...n {
                if adj[u][w] == 1 && adj[v][w] == 1 {
                    ans = min(ans, deg[u] + deg[v] + deg[w] - 6)
                }
            }
        }
        return ans == Int.max ? -1 : ans
    }
}

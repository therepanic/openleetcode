class Solution {
    func countSubgraphsForEachDiameter(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var graph = [[Int]](repeating: [], count: n)
        for e in edges {
            let u = e[0] - 1, v = e[1] - 1
            graph[u].append(v)
            graph[v].append(u)
        }
        var answer = [Int](repeating: 0, count: n - 1)
        for mask in 1..<(1 << n) {
            if mask.nonzeroBitCount <= 1 { continue }
            let b = mask & -mask
            let s = b.trailingZeroBitCount
            var seen = [Bool](repeating: false, count: n)
            seen[s] = true
            var cnt = 1
            var q = [s]
            var idx = 0
            while idx < q.count {
                let u = q[idx]
                idx += 1
                for v in graph[u] {
                    if ((mask >> v) & 1) == 1 && !seen[v] {
                        seen[v] = true
                        cnt += 1
                        q.append(v)
                    }
                }
            }
            if cnt != mask.nonzeroBitCount { continue }
            func bfs(_ start: Int) -> (Int, Int) {
                var dist = [Int](repeating: -1, count: n)
                dist[start] = 0
                var q = [start]
                var idx = 0
                var last = start
                while idx < q.count {
                    let u = q[idx]
                    idx += 1
                    last = u
                    for v in graph[u] {
                        if ((mask >> v) & 1) == 1 && dist[v] == -1 {
                            dist[v] = dist[u] + 1
                            q.append(v)
                        }
                    }
                }
                return (last, dist[last])
            }
            let (a, _) = bfs(s)
            let (_, d) = bfs(a)
            if d >= 1 {
                answer[d - 1] += 1
            }
        }
        return answer
    }
}

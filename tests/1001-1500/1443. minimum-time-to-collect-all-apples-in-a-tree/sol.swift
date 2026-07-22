class Solution {
    func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
        var adj = [[Int]](repeating: [], count: n)
        var degree = [Int](repeating: 0, count: n)

        for e in edges {
            let u = e[0], v = e[1]
            adj[u].append(v)
            adj[v].append(u)
            degree[u] += 1
            degree[v] += 1
        }

        var q = [Int]()
        for i in 1..<n {
            if degree[i] == 1 && !hasApple[i] {
                q.append(i)
            }
        }

        var keep = [Bool](repeating: true, count: n)

        while !q.isEmpty {
            let u = q.removeFirst()
            keep[u] = false

            for v in adj[u] {
                degree[v] -= 1
                if v != 0 && keep[v] && !hasApple[v] && degree[v] == 1 {
                    q.append(v)
                }
            }
        }

        let activeNodes = keep.filter { $0 }.count
        return max(0, (activeNodes - 1) * 2)
    }
}

class Solution {
    func unhappyFriends(_ n: Int, _ preferences: [[Int]], _ pairs: [[Int]]) -> Int {
        var graph = [Int](repeating: 0, count: n)
        for p in pairs {
            graph[p[0]] = p[1]
            graph[p[1]] = p[0]
        }

        var rank = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        for i in 0..<n {
            for (j, e) in preferences[i].enumerated() {
                rank[i][e] = j
            }
        }

        var ans = 0
        for u in 0..<n {
            let v = graph[u]
            var unhappy = false
            for a in preferences[u] {
                if a == v { break }
                let av = graph[a]
                if rank[a][u] < rank[a][av] {
                    unhappy = true
                    break
                }
            }
            if unhappy { ans += 1 }
        }
        return ans
    }
}

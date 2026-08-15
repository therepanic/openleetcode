class Solution {
    func areConnected(_ n: Int, _ threshold: Int, _ queries: [[Int]]) -> [Bool] {
        var limit = n
        for q in queries {
            limit = max(limit, max(q[0], q[1]))
        }
        var parent = [Int](0...limit)
        var rank = [Int](repeating: 1, count: limit + 1)

        func find(_ x: Int) -> Int {
            var res = x
            while res != parent[res] {
                parent[res] = parent[parent[res]]
                res = parent[res]
            }
            return res
        }

        func union(_ a: Int, _ b: Int) -> Bool {
            let p1 = find(a)
            let p2 = find(b)
            if p1 == p2 { return false }
            if rank[p1] > rank[p2] {
                parent[p2] = p1
                rank[p1] += rank[p2]
            } else {
                parent[p1] = p2
                rank[p2] += rank[p1]
            }
            return true
        }

        if threshold < limit {
            for i in (threshold + 1)...limit {
                for j in stride(from: 2 * i, through: limit, by: i) {
                    union(i, j)
                }
            }
        }

        return queries.map { find($0[0]) == find($0[1]) }
    }
}

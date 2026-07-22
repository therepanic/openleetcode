class Solution {
    func makeConnected(_ n: Int, _ connections: [[Int]]) -> Int {
        if connections.count < n - 1 {
            return -1
        }

        var parent = Array(0..<n)
        var size = Array(repeating: 1, count: n)

        func find(_ node: Int) -> Int {
            if parent[node] != node {
                parent[node] = find(parent[node])
            }
            return parent[node]
        }

        func union(_ u: Int, _ v: Int) {
            let pu = find(u)
            let pv = find(v)
            if pu == pv { return }
            if size[pu] < size[pv] {
                parent[pu] = pv
                size[pv] += size[pu]
            } else {
                parent[pv] = pu
                size[pu] += size[pv]
            }
        }

        var extra = 0
        for conn in connections {
            let u = conn[0]
            let v = conn[1]
            if find(u) == find(v) {
                extra += 1
            } else {
                union(u, v)
            }
        }

        var components = 0
        for i in 0..<n {
            if find(i) == i {
                components += 1
            }
        }

        return extra >= components - 1 ? components - 1 : -1
    }
}

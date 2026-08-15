class Solution {
    func maxNumEdgesToRemove(_ n: Int, _ edges: [[Int]]) -> Int {
        var edges = edges
        edges.sort { $0[0] > $1[0] }
        var parentA = Array(0...n)
        var parentB = Array(0...n)
        var rankA = Array(repeating: 0, count: n + 1)
        var rankB = Array(repeating: 0, count: n + 1)

        func find(_ parent: inout [Int], _ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(&parent, parent[x])
            }
            return parent[x]
        }

        func union(_ parent: inout [Int], _ rank: inout [Int], _ x: Int, _ y: Int) -> Bool {
            let rootX = find(&parent, x)
            let rootY = find(&parent, y)
            if rootX == rootY { return false }
            if rank[rootX] < rank[rootY] {
                parent[rootX] = rootY
            } else if rank[rootX] > rank[rootY] {
                parent[rootY] = rootX
            } else {
                parent[rootX] = rootY
                rank[rootY] += 1
            }
            return true
        }

        var removed = 0
        var aliceEdges = 0
        var bobEdges = 0
        for e in edges {
            if e[0] == 3 {
                if union(&parentA, &rankA, e[1], e[2]) {
                    union(&parentB, &rankB, e[1], e[2])
                    aliceEdges += 1
                    bobEdges += 1
                } else {
                    removed += 1
                }
            } else if e[0] == 2 {
                if union(&parentB, &rankB, e[1], e[2]) {
                    bobEdges += 1
                } else {
                    removed += 1
                }
            } else {
                if union(&parentA, &rankA, e[1], e[2]) {
                    aliceEdges += 1
                } else {
                    removed += 1
                }
            }
        }
        return (bobEdges == n - 1 && aliceEdges == n - 1) ? removed : -1
    }
}

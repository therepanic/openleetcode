class Solution {
    func distanceLimitedPathsExist(_ n: Int, _ edgeList: [[Int]], _ queries: [[Int]]) -> [Bool] {
        var parent = Array(0..<n)
        var rank = Array(repeating: 0, count: n)
        
        func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }
        
        func union(_ x: Int, _ y: Int) {
            let xroot = find(x)
            let yroot = find(y)
            if xroot == yroot { return }
            if rank[xroot] < rank[yroot] {
                parent[xroot] = yroot
            } else if rank[xroot] > rank[yroot] {
                parent[yroot] = xroot
            } else {
                parent[yroot] = xroot
                rank[xroot] += 1
            }
        }
        
        // add index to queries
        var queriesWithIdx = [[Int]]()
        for (i, q) in queries.enumerated() {
            queriesWithIdx.append([q[0], q[1], q[2], i])
        }
        
        queriesWithIdx.sort { $0[2] < $1[2] }
        var sortedEdges = edgeList.sorted { $0[2] < $1[2] }
        
        var idx = 0
        var res = Array(repeating: false, count: queries.count)
        for q in queriesWithIdx {
            while idx < sortedEdges.count && sortedEdges[idx][2] < q[2] {
                union(sortedEdges[idx][0], sortedEdges[idx][1])
                idx += 1
            }
            if find(q[0]) == find(q[1]) {
                res[q[3]] = true
            }
        }
        return res
    }
}

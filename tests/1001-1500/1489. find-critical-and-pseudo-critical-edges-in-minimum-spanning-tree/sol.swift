class Solution {
    class UnionFind {
        var parent: [Int]
        init(_ n: Int) {
            parent = Array(0..<n)
        }
        func findParent(_ p: Int) -> Int {
            if parent[p] == p { return p }
            parent[p] = findParent(parent[p])
            return parent[p]
        }
        func union(_ u: Int, _ v: Int) {
            let pu = findParent(u)
            let pv = findParent(v)
            parent[pu] = pv
        }
    }

    func findMST(_ n: Int, _ edges: [[Int]], _ block: Int, _ e: Int) -> Int {
        let uf = UnionFind(n)
        var weight = 0
        if e != -1 {
            weight += edges[e][2]
            uf.union(edges[e][0], edges[e][1])
        }
        for i in 0..<edges.count {
            if i == block { continue }
            if uf.findParent(edges[i][0]) == uf.findParent(edges[i][1]) { continue }
            uf.union(edges[i][0], edges[i][1])
            weight += edges[i][2]
        }
        for i in 0..<n {
            if uf.findParent(i) != uf.findParent(0) { return Int.max }
        }
        return weight
    }

    func findCriticalAndPseudoCriticalEdges(_ n: Int, _ edges: [[Int]]) -> [[Int]] {
        var edgesWithIdx = edges.enumerated().map { pair in
            var edge = pair.element
            edge.append(pair.offset)
            return edge
        }
        edgesWithIdx.sort { $0[2] < $1[2] }
        let mstwt = findMST(n, edgesWithIdx, -1, -1)
        var critical = [Int]()
        var pseudoCritical = [Int]()
        for i in 0..<edgesWithIdx.count {
            if mstwt < findMST(n, edgesWithIdx, i, -1) {
                critical.append(edgesWithIdx[i][3])
            } else if mstwt == findMST(n, edgesWithIdx, -1, i) {
                pseudoCritical.append(edgesWithIdx[i][3])
            }
        }
        return [critical, pseudoCritical]
    }
}

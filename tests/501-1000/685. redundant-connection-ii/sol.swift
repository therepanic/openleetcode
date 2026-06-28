class Solution {
    private var parent: [Int] = []
    private var rank: [Int] = []
    
    private func find(_ u: Int) -> Int {
        if parent[u] != u {
            parent[u] = find(parent[u])
        }
        return parent[u]
    }
    
    private func union(_ u: Int, _ v: Int) -> Bool {
        let pu = find(u)
        let pv = find(v)
        if pu == pv { return false }
        if rank[pu] < rank[pv] {
            parent[pu] = pv
        } else if rank[pv] < rank[pu] {
            parent[pv] = pu
        } else {
            parent[pu] = pv
            rank[pv] += 1
        }
        return true
    }
    
    func findRedundantDirectedConnection(_ edges: [[Int]]) -> [Int] {
        let n = edges.count
        parent = Array(0...n)
        rank = Array(repeating: 0, count: n + 1)
        var parentArr = Array(repeating: 0, count: n + 1)
        
        var candidate1: [Int]? = nil
        var candidate2: [Int]? = nil
        
        for edge in edges {
            let u = edge[0], v = edge[1]
            if parentArr[v] != 0 {
                candidate1 = [parentArr[v], v]
                candidate2 = [u, v]
                break
            }
            parentArr[v] = u
        }
        
        for edge in edges {
            let u = edge[0], v = edge[1]
            if let c2 = candidate2, u == c2[0], v == c2[1] {
                continue
            }
            if !union(u, v) {
                return candidate1 ?? [u, v]
            }
        }
        
        return candidate2!
    }
}

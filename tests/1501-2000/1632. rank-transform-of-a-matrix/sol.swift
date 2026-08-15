class Solution {
    func matrixRankTransform(_ matrix: [[Int]]) -> [[Int]] {
        let m = matrix.count, n = matrix[0].count
        var mp: [Int: [(Int, Int)]] = [:]
        for i in 0..<m {
            for j in 0..<n {
                mp[matrix[i][j], default: []].append((i, j))
            }
        }
        
        var rank = Array(repeating: 0, count: m+n)
        var ans = Array(repeating: Array(repeating: 0, count: n), count: m)
        
        for k in mp.keys.sorted() {
            var parent = Array(0..<(m+n))
            func find(_ p: Int) -> Int {
                if p != parent[p] { parent[p] = find(parent[p]) }
                return parent[p]
            }
            
            for (i, j) in mp[k]! {
                let ii = find(i)
                let jj = find(m+j)
                parent[ii] = jj
                rank[jj] = max(rank[ii], rank[jj])
            }
            
            var seen = Set<Int>()
            for (i, j) in mp[k]! {
                let ii = find(i)
                if !seen.contains(ii) { rank[ii] += 1 }
                seen.insert(ii)
                let v = rank[ii]
                rank[i] = v
                rank[m+j] = v
                ans[i][j] = v
            }
        }
        return ans
    }
}

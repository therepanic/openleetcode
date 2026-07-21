class Solution {
    func smallestStringWithSwaps(_ s: String, _ pairs: [[Int]]) -> String {
        let n = s.count
        var parent = Array(0..<n)
        let chars = Array(s)
        
        func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }
        
        func union(_ x: Int, _ y: Int) {
            let rx = find(x)
            let ry = find(y)
            if rx != ry {
                parent[rx] = ry
            }
        }
        
        for pair in pairs {
            union(pair[0], pair[1])
        }
        
        var groups = [Int: [Int]]()
        for i in 0..<n {
            let root = find(i)
            groups[root, default: []].append(i)
        }
        
        var res = Array(repeating: Character(" "), count: n)
        for indices in groups.values {
            var sortedIndices = indices.sorted()
            var sortedChars = indices.map { chars[$0] }.sorted()
            for k in 0..<sortedIndices.count {
                res[sortedIndices[k]] = sortedChars[k]
            }
        }
        
        return String(res)
    }
}

class Solution {
    func minSwapsCouples(_ row: [Int]) -> Int {
        let n = row.count / 2
        var parent = Array(0..<n)
        
        func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }
        
        func union(_ a: Int, _ b: Int) {
            let pa = find(a)
            let pb = find(b)
            if pa != pb {
                parent[pa] = pb
            }
        }
        
        for i in stride(from: 0, to: row.count, by: 2) {
            let couple1 = row[i] / 2
            let couple2 = row[i+1] / 2
            union(couple1, couple2)
        }
        
        var componentSize: [Int: Int] = [:]
        for couple in 0..<n {
            let root = find(couple)
            componentSize[root, default: 0] += 1
        }
        
        var swaps = 0
        for size in componentSize.values {
            swaps += size - 1
        }
        
        return swaps
    }
}

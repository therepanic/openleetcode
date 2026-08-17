class Solution {
    func minimumHammingDistance(_ source: [Int], _ target: [Int], _ allowedSwaps: [[Int]]) -> Int {
        let n = source.count
        var parent = Array(0..<n)
        
        func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }
        
        func unite(_ a: Int, _ b: Int) {
            parent[find(a)] = find(b)
        }
        
        for swap in allowedSwaps {
            unite(swap[0], swap[1])
        }
        
        var groups: [Int: [Int]] = [:]
        for i in 0..<n {
            let root = find(i)
            groups[root, default: []].append(source[i])
        }
        var freqMap: [Int: [Int: Int]] = [:]
        for (root, vals) in groups {
            var freq: [Int: Int] = [:]
            for v in vals {
                freq[v, default: 0] += 1
            }
            freqMap[root] = freq
        }
        
        var hammingDist = 0
        for i in 0..<n {
            let root = find(i)
            let val = target[i]
            if freqMap[root]![val, default: 0] > 0 {
                freqMap[root]![val]! -= 1
            } else {
                hammingDist += 1
            }
        }
        return hammingDist
    }
}

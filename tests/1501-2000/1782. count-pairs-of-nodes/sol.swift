import Foundation

class Solution {
    func countPairs(_ n: Int, _ edges: [[Int]], _ queries: [Int]) -> [Int] {
        var x = [Int: Set<Int>]()
        var edge = Array(repeating: 0, count: n)
        var edgePair = [String: Int]()

        for e in edges {
            let i = e[0] - 1
            let j = e[1] - 1
            x[i, default: Set()].insert(j)
            x[j, default: Set()].insert(i)
            edge[i] += 1
            edge[j] += 1
            edgePair["\(i),\(j)", default: 0] += 1
            edgePair["\(j),\(i)", default: 0] += 1
        }
        
        let res = edge.sorted()
        
        func binse(_ threshold: Int) -> Int {
            var i = 0
            var j = n - 1
            var ans = n
            while i <= j {
                let mid = (i + j) / 2
                if res[mid] > threshold {
                    ans = mid
                    j = mid - 1
                } else {
                    i = mid + 1
                }
            }
            return n - ans
        }
        
        var result = [Int]()
        for query in queries {
            var v = Set<Int>()
            var ans = 0
            
            func f(_ i: Int) {
                v.insert(i)
                var a = binse(query - edge[i])
                
                if edge[i] > query - edge[i] {
                    a -= 1
                }
                
                for j in x[i] ?? [] {
                    if edge[j] > query - edge[i] && edge[j] - (edgePair["\(i),\(j)"] ?? 0) <= query - edge[i] {
                        a -= 1
                    }
                    if !v.contains(j) {
                        f(j)
                    }
                }
                ans += a
            }
            
            for j in 0..<n {
                if !v.contains(j) {
                    f(j)
                }
            }
            result.append(ans / 2)
        }
        
        return result
    }
}

class Solution {
    func recoverArray(_ n: Int, _ sums: [Int]) -> [Int] {
        var sums = sums.sorted()
        var res: [Int] = []
        
        for _ in 0..<n {
            let d = sums[1] - sums[0]
            
            var left: [Int] = []
            var right: [Int] = []
            var count: [Int: Int] = [:]
            for s in sums {
                count[s, default: 0] += 1
            }
            
            for s in sums {
                if count[s]! > 0 {
                    left.append(s)
                    right.append(s + d)
                    count[s]! -= 1
                    count[s + d, default: 0] -= 1
                }
            }
            
            if left.contains(0) {
                res.append(d)
                sums = left
            } else {
                res.append(-d)
                sums = right
            }
        }
        return res
    }
}

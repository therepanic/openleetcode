class Solution {
    func getProbability(_ balls: [Int]) -> Double {
        let sm = balls.reduce(0, +)
        var expanded = [Int]()
        for (i, b) in balls.enumerated() {
            for _ in 0..<b {
                expanded.append(i)
            }
        }
        
        var memo = [String: Int]()
        
        func dp(_ i: Int, _ cnt0: Int, _ mask0: Int, _ mask1: Int) -> Int {
            let key = "\(i),\(cnt0),\(mask0),\(mask1)"
            if let val = memo[key] { return val }
            
            let cnt1 = i - cnt0
            if cnt0 > sm / 2 || cnt1 > sm / 2 {
                memo[key] = 0
                return 0
            }
            
            if i == expanded.count {
                let result = mask0.nonzeroBitCount == mask1.nonzeroBitCount ? 1 : 0
                memo[key] = result
                return result
            }
            
            let result = dp(i + 1, cnt0 + 1, mask0 | (1 << expanded[i]), mask1) +
                         dp(i + 1, cnt0, mask0, mask1 | (1 << expanded[i]))
            memo[key] = result
            return result
        }
        
        let favorable = dp(0, 0, 0, 0)
        let total = comb(sm, sm / 2)
        return Double(favorable) / Double(total)
    }
    
    private func comb(_ n: Int, _ k: Int) -> Int {
        var res = 1
        for i in 1...k {
            res = res * (n - k + i) / i
        }
        return res
    }
}

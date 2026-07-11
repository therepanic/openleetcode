class Solution {
    private var memo: [Int: Int] = [:]
    
    func leastOpsExpressTarget(_ x: Int, _ target: Int) -> Int {
        return dfs(target, x)
    }
    
    private func dfs(_ val: Int, _ x: Int) -> Int {
        if let cached = memo[val] {
            return cached
        }
        if val < x {
            let res = min(2 * val - 1, 2 * (x - val))
            memo[val] = res
            return res
        }
        
        let k = Int(log(Double(val)) / log(Double(x)))
        let pow = Int(pow(Double(x), Double(k)))
        var ans = k + dfs(val - pow, x)
        
        let nextPow = pow * x
        if nextPow < 2 * val {
            ans = min(ans, k + 1 + dfs(nextPow - val, x))
        }
        
        memo[val] = ans
        return ans
    }
}

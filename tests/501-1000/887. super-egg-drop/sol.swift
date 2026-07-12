class Solution {
    func superEggDrop(_ k: Int, _ n: Int) -> Int {
        var memo = Array(repeating: Array(repeating: -1, count: n + 1), count: k + 1)
        
        func solve(_ eggs: Int, _ floors: Int) -> Int {
            if floors <= 1 || eggs == 1 {
                return floors
            }
            if memo[eggs][floors] != -1 {
                return memo[eggs][floors]
            }
            
            var low = 1
            var high = floors
            var ans = floors
            
            while low <= high {
                let mid = (low + high) / 2
                let breakCase = solve(eggs - 1, mid - 1)
                let notBreakCase = solve(eggs, floors - mid)
                
                ans = min(ans, 1 + max(breakCase, notBreakCase))
                if breakCase < notBreakCase {
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            }
            
            memo[eggs][floors] = ans
            return ans
        }
        
        return solve(k, n)
    }
}

class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n <= 3 { return n }
        var prev2 = 2
        var prev1 = 3
        if n >= 4 {
            for _ in 4...n {
                let cur = prev1 + prev2
                prev2 = prev1
                prev1 = cur
            }
        }
        return prev1
    }
}

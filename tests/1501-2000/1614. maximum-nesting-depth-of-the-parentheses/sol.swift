class Solution {
    func maxDepth(_ s: String) -> Int {
        var ctr = 0
        var ans = 0
        for ch in s {
            if ch == "(" {
                ctr += 1
                ans = max(ans, ctr)
            } else if ch == ")" {
                ctr -= 1
            }
        }
        return ans
    }
}

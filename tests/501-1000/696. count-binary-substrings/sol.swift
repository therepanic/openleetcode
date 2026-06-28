class Solution {
    func countBinarySubstrings(_ s: String) -> Int {
        var ans = 0, prev = 0, cur = 1
        let chars = Array(s)
        for i in 1..<chars.count {
            if chars[i-1] != chars[i] {
                ans += min(prev, cur)
                prev = cur
                cur = 1
            } else {
                cur += 1
            }
        }
        return ans + min(prev, cur)
    }
}

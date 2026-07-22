class Solution {
    func maxPower(_ s: String) -> Int {
        var maxcnt = 0
        var cnt = 0
        let chars = Array(s)
        for i in 1..<chars.count {
            if chars[i] == chars[i - 1] {
                cnt += 1
            } else {
                cnt = 0
            }
            maxcnt = max(cnt, maxcnt)
        }
        return maxcnt + 1
    }
}

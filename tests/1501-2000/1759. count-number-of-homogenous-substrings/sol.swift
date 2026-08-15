class Solution {
    func countHomogenous(_ s: String) -> Int {
        let mod = 1_000_000_007
        let chars = Array(s)
        let n = chars.count
        var res = 1
        var cnt = 1
        for i in 1..<n {
            if chars[i] != chars[i - 1] {
                cnt = 0
            }
            cnt += 1
            res = (res + cnt) % mod
        }
        return res
    }
}

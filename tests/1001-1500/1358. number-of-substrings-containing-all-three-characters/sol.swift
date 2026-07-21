class Solution {
    func numberOfSubstrings(_ s: String) -> Int {
        var res = 0
        var p = [50000, -1, -1, -1]
        for (i, ch) in s.enumerated() {
            p[Int(ch.asciiValue! & 31)] = i
            res += min(p[1], p[2], p[3]) + 1
        }
        return res
    }
}

class Solution {
    func minOperations(_ s: String) -> Int {
        var c = 0
        var j = 0
        let n = s.count
        for ch in s {
            if ch == "0" && j == 0 {
                c += 1
            } else if ch == "1" && j == 1 {
                c += 1
            }
            j ^= 1
        }
        return min(c, n - c)
    }
}

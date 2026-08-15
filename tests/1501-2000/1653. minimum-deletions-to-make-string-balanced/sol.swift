class Solution {
    func minimumDeletions(_ s: String) -> Int {
        var res = 0
        var count = 0
        for ch in s {
            if ch == "b" {
                count += 1
            } else if count > 0 {
                res += 1
                count -= 1
            }
        }
        return res
    }
}

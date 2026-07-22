class Solution {
    func numSub(_ s: String) -> Int {
        var cnt = 0
        var total = 0
        let mod = 1000000007
        for a in s {
            if a == "1" {
                cnt += 1
            } else {
                cnt = 0
            }
            total = (total + cnt) % mod
        }
        return total
    }
}

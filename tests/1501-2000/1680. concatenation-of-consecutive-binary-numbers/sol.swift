class Solution {
    func concatenatedBinary(_ n: Int) -> Int {
        let MOD = 1_000_000_007
        var res = 0
        var bits = 0

        for i in 1...n {
            if (i & (i - 1)) == 0 {
                bits += 1
            }
            res = ((res << bits) | i) % MOD
        }

        return res
    }
}

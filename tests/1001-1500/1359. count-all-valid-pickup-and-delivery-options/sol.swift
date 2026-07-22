class Solution {
    func countOrders(_ n: Int) -> Int {
        let MOD = 1000000007
        var count = 1
        if n >= 2 {
            for i in 2...n {
                count = (count * (2 * i - 1) * i) % MOD
            }
        }
        return count
    }
}

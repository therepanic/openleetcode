class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        var count = 0
        var divisor = 5
        while divisor <= n {
            count += n / divisor
            divisor *= 5
        }
        return count
    }
}

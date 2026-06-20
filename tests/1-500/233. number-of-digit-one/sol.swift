class Solution {
    func countDigitOne(_ n: Int) -> Int {
        var count = 0
        var factor = 1
        while factor <= n {
            let lower = n % factor
            let cur = (n / factor) % 10
            let higher = n / (factor * 10)
            if cur == 0 {
                count += higher * factor
            } else if cur == 1 {
                count += higher * factor + lower + 1
            } else {
                count += (higher + 1) * factor
            }
            factor *= 10
        }
        return count
    }
}

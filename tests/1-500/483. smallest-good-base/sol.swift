import Foundation

class Solution {
    func smallestGoodBase(_ n: String) -> String {
        guard let num = UInt64(n) else { return "" }
        let maxM = Int(log2(Double(num)))
        for m in stride(from: maxM, through: 1, by: -1) {
            var left: UInt64 = 2
            var right = UInt64(pow(Double(num), 1.0 / Double(m))) + 1
            while left <= right {
                let mid = left + (right - left) / 2
                let cmp = compare(base: mid, m: m, n: num)
                if cmp == 0 {
                    return String(mid)
                }
                if cmp < 0 {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return String(num - 1)
    }

    private func compare(base: UInt64, m: Int, n: UInt64) -> Int {
        var sum: UInt64 = 1
        var cur: UInt64 = 1
        for _ in 0..<m {
            if cur > (n - sum) / base {
                return 1
            }
            cur *= base
            sum += cur
            if sum > n {
                return 1
            }
        }
        return sum == n ? 0 : -1
    }
}

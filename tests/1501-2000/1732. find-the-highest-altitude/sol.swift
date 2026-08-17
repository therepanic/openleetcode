class Solution {
    func largestAltitude(_ gain: [Int]) -> Int {
        var ans = 0
        var acc = 0
        for it in gain {
            acc += it
            let d = acc - ans
            ans += d & ~(d >> 31)
        }
        return ans
    }
}

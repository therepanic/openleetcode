class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var value = UInt32(truncatingIfNeeded: n)
        var ans = 0
        while value != 0 {
            ans += Int(value & 1)
            value >>= 1
        }
        return ans
    }
}

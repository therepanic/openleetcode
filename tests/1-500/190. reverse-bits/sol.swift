class Solution {
    func reverseBits(_ n: Int) -> Int {
        var value = UInt32(truncatingIfNeeded: n)
        var ans: UInt32 = 0
        for _ in 0..<32 {
            ans = (ans << 1) | (value & 1)
            value >>= 1
        }
        return Int(ans)
    }
}

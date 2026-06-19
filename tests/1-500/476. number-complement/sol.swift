class Solution {
    func findComplement(_ num: Int) -> Int {
        var bit = 1
        var curr = num
        var result = num
        while curr > 0 {
            result ^= bit
            bit <<= 1
            curr >>= 1
        }
        return result
    }
}

class Solution {
    func isOneBitCharacter(_ bits: [Int]) -> Bool {
        let n = bits.count
        var i = 0
        while i < n - 1 {
            i += 1 + (bits[i] == 1 ? 1 : 0)
        }
        return i == n - 1
    }
}

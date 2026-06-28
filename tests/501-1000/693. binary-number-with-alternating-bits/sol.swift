class Solution {
    func hasAlternatingBits(_ n: Int) -> Bool {
        let x = n ^ (n >> 1)
        return (x & (x + 1)) == 0
    }
}

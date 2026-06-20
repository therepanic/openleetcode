class Solution {
    func isPowerOfFour(_ n: Int) -> Bool {
        return n > 0 && n.nonzeroBitCount == 1 && (n - 1) % 3 == 0
    }
}

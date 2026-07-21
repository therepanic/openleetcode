class Solution {
    func removePalindromeSub(_ s: String) -> Int {
        return String(s.reversed()) == s ? 1 : 2
    }
}

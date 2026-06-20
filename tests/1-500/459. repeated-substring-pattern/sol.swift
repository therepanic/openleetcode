class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        let doubled = (s + s).dropFirst().dropLast()
        return doubled.contains(s)
    }
}

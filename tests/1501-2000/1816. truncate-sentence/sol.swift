class Solution {
    func truncateSentence(_ s: String, _ k: Int) -> String {
        let words = s.split(separator: " ")
        return words.prefix(k).joined(separator: " ")
    }
}

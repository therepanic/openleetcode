class Solution {
    func reverseWords(_ s: String) -> String {
        let words = s.split(separator: " ")
        let reversedWords = words.map { String($0.reversed()) }
        return reversedWords.joined(separator: " ")
    }
}

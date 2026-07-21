class Solution {
    func isPrefixOfWord(_ sentence: String, _ searchWord: String) -> Int {
        let words = sentence.split(separator: " ")
        for i in 0..<words.count {
            if words[i].hasPrefix(searchWord) {
                return i + 1
            }
        }
        return -1
    }
}

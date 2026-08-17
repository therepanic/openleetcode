class Solution {
    func sortSentence(_ s: String) -> String {
        var words: [Int: String] = [:]
        for word in s.split(separator: " ") {
            let key = Int(String(word.last!))!
            words[key] = String(word.dropLast())
        }
        let sortedKeys = words.keys.sorted()
        return sortedKeys.map { words[$0]! }.joined(separator: " ")
    }
}

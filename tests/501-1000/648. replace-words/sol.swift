class Solution {
    func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
        let roots = Set(dictionary)
        var words = sentence.split(separator: " ").map(String.init)

        for idx in words.indices {
            let word = words[idx]
            var replacement = word
            for len in 1...word.count {
                let prefix = String(word.prefix(len))
                if roots.contains(prefix) {
                    replacement = prefix
                    break
                }
            }
            words[idx] = replacement
        }

        return words.joined(separator: " ")
    }
}

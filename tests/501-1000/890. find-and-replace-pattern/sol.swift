class Solution {
    func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
        let counts = pattern.map { pattern.firstIndex(of: $0)! }
        var res: [String] = []
        for word in words {
            let count = word.map { word.firstIndex(of: $0)! }
            if count == counts {
                res.append(word)
            }
        }
        return res
    }
}

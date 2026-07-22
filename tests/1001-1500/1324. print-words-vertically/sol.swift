class Solution {
    func printVertically(_ s: String) -> [String] {
        let words = s.split(separator: " ").map { String($0) }
        let maxLen = words.map { $0.count }.max() ?? 0
        var res = [String]()
        for i in 0..<maxLen {
            var currWord = ""
            for word in words {
                if i < word.count {
                    let idx = word.index(word.startIndex, offsetBy: i)
                    currWord.append(word[idx])
                } else {
                    currWord.append(" ")
                }
            }
            while currWord.last == " " {
                currWord.removeLast()
            }
            res.append(currWord)
        }
        return res
    }
}

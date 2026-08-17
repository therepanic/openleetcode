class Solution {
    func reorderSpaces(_ text: String) -> String {
        let words = text.split(separator: " ").map(String.init)
        let total = text.filter { $0 == " " }.count
        if words.count == 1 {
            return words[0] + String(repeating: " ", count: total)
        }
        let gap = total / (words.count - 1)
        let extra = total % (words.count - 1)
        return words.joined(separator: String(repeating: " ", count: gap)) + String(repeating: " ", count: extra)
    }
}

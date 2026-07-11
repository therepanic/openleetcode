class Solution {
    func findOcurrences(_ text: String, _ first: String, _ second: String) -> [String] {
        let words = text.split(separator: " ").map { String($0) }
        var result: [String] = []
        for i in 0..<words.count - 2 {
            if words[i] == first && words[i + 1] == second {
                result.append(words[i + 2])
            }
        }
        return result
    }
}

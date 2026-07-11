class Solution {
    func uncommonFromSentences(_ s1: String, _ s2: String) -> [String] {
        let words = s1.split(separator: " ") + s2.split(separator: " ")
        var count = [String: Int]()
        for word in words {
            count[String(word), default: 0] += 1
        }
        return count.filter { $0.value == 1 }.map { $0.key }
    }
}

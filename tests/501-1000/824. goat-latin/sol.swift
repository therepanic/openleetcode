class Solution {
    func toGoatLatin(_ sentence: String) -> String {
        let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        let words = sentence.split(separator: " ")
        var ans: [String] = []
        for (i, word) in words.enumerated() {
            let wordStr = String(word)
            var goat: String
            if vowels.contains(wordStr.first!) {
                goat = wordStr + "ma"
            } else {
                goat = String(wordStr.dropFirst()) + String(wordStr.first!) + "ma"
            }
            goat += String(repeating: "a", count: i + 1)
            ans.append(goat)
        }
        return ans.joined(separator: " ")
    }
}

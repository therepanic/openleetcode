class Solution {
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        let storage = [
            ".-", "-...", "-.-.", "-..", ".", "..-.", "--.",
            "....", "..", ".---", "-.-", ".-..", "--", "-.",
            "---", ".--.", "--.-", ".-.", "...", "-", "..-",
            "...-", ".--", "-..-", "-.--", "--.."
        ]

        var st = Set<String>()

        for word in words {
            var temp = ""
            for ch in word {
                let index = Int(ch.asciiValue! - Character("a").asciiValue!)
                temp += storage[index]
            }
            st.insert(temp)
        }

        return st.count
    }
}

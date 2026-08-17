class Solution {
    func isSumEqual(_ firstWord: String, _ secondWord: String, _ targetWord: String) -> Bool {
        func convert(_ word: String) -> Int {
            var s = ""
            for ch in word {
                s += String(ch.asciiValue! - Character("a").asciiValue!)
            }
            return Int(s) ?? 0
        }
        return convert(firstWord) + convert(secondWord) == convert(targetWord)
    }
}

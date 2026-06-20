class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var wordSet = Set(wordList)
        if !wordSet.contains(endWord) { return 0 }
        var queue: [(String, Int)] = [(beginWord, 1)]
        var index = 0
        while index < queue.count {
            let (word, steps) = queue[index]
            index += 1
            if word == endWord { return steps }
            var chars = Array(word)
            for i in chars.indices {
                let original = chars[i]
                for scalar in UInt8(ascii: "a")...UInt8(ascii: "z") {
                    chars[i] = Character(UnicodeScalar(scalar))
                    let candidate = String(chars)
                    if wordSet.remove(candidate) != nil { queue.append((candidate, steps + 1)) }
                }
                chars[i] = original
            }
        }
        return 0
    }
}

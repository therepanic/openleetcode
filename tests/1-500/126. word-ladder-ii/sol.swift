class Solution {
    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        var depth = [beginWord: 1]
        var result = [[String]]()
        var wordSet = Set(wordList)
        var queue = [beginWord]
        var index = 0
        wordSet.remove(beginWord)
        while index < queue.count {
            let word = queue[index]
            index += 1
            let steps = depth[word]!
            if word == endWord { break }
            var chars = Array(word)
            for i in chars.indices {
                let original = chars[i]
                for scalar in UInt8(ascii: "a")...UInt8(ascii: "z") {
                    chars[i] = Character(UnicodeScalar(scalar))
                    let candidate = String(chars)
                    if wordSet.remove(candidate) != nil { queue.append(candidate); depth[candidate] = steps + 1 }
                }
                chars[i] = original
            }
        }
        if depth[endWord] == nil { return result }
        var path = [endWord]
        func dfs(_ word: String) {
            if word == beginWord { result.append(path.reversed()); return }
            let steps = depth[word]!
            var chars = Array(word)
            for i in chars.indices {
                let original = chars[i]
                for scalar in UInt8(ascii: "a")...UInt8(ascii: "z") {
                    chars[i] = Character(UnicodeScalar(scalar))
                    let candidate = String(chars)
                    if let prev = depth[candidate], prev + 1 == steps {
                        path.append(candidate)
                        dfs(candidate)
                        path.removeLast()
                    }
                }
                chars[i] = original
            }
        }
        dfs(endWord)
        return result
    }
}

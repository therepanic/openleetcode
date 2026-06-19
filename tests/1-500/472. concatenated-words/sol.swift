class Solution {
    func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
        var res = [String]()
        var wordSet = Set(words)
        var incorrect = Set<String>()
        
        func dfs(_ word: String) -> Bool {
            if wordSet.contains(word) {
                return true
            }
            if incorrect.contains(word) {
                return false
            }
            
            for i in 1..<word.count {
                let prefix = String(word.prefix(i))
                if wordSet.contains(prefix) {
                    let suffix = String(word.suffix(word.count - i))
                    if dfs(suffix) {
                        return true
                    } else {
                        incorrect.insert(suffix)
                    }
                }
            }
            
            incorrect.insert(word)
            return false
        }
        
        for word in words {
            wordSet.remove(word)
            if dfs(word) {
                res.append(word)
            }
            wordSet.insert(word)
        }
        
        return res
    }
}

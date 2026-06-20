class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        let words = s.split(separator: " ").map(String.init)
        if pattern.count != words.count { return false }
        
        let patternChars = Array(pattern)
        return Set(patternChars).count == Set(words).count &&
               Set(zip(patternChars, words).map { "\($0),\($1)" }).count == Set(patternChars).count
    }
}

class Solution {
    func countConsistentStrings(_ allowed: String, _ words: [String]) -> Int {
        var result = 0
        let allowedSet = Set(allowed)
        for word in words {
            var allIn = true
            for c in word {
                if !allowedSet.contains(c) {
                    allIn = false
                    break
                }
            }
            if allIn {
                result += 1
            }
        }
        return result
    }
}

class Solution {
    func numOfStrings(_ patterns: [String], _ word: String) -> Int {
        var count = 0
        for s in patterns {
            if word.contains(s) {
                count += 1
            }
        }
        return count
    }
}

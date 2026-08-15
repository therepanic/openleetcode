class Solution {
    func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
        let s1 = word1.joined()
        let s2 = word2.joined()
        return s1 == s2
    }
}

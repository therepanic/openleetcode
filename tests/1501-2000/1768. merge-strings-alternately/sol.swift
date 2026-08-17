class Solution {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var merged = ""
        let chars1 = Array(word1)
        let chars2 = Array(word2)
        let minLen = min(chars1.count, chars2.count)
        for i in 0..<minLen {
            merged.append(chars1[i])
            merged.append(chars2[i])
        }
        if chars1.count > minLen {
            merged.append(contentsOf: chars1[minLen...])
        }
        if chars2.count > minLen {
            merged.append(contentsOf: chars2[minLen...])
        }
        return merged
    }
}

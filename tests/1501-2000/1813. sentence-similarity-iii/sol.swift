class Solution {
    func areSentencesSimilar(_ sentence1: String, _ sentence2: String) -> Bool {
        let s1 = sentence1.split(separator: " ")
        let s2 = sentence2.split(separator: " ")
        
        var l1 = 0, l2 = 0, r1 = s1.count - 1, r2 = s2.count - 1
        
        while l1 <= r1 && l2 <= r2 {
            if s1[l1] == s2[l2] {
                l1 += 1
                l2 += 1
            } else if s1[r1] == s2[r2] {
                r1 -= 1
                r2 -= 1
            } else {
                return false
            }
        }
        
        return true
    }
}

class Solution {
    func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
        let chars1 = Array(s1)
        let chars2 = Array(s2)
        var i = -1
        var j = -1
        var cnt = 0
        for k in 0..<chars1.count {
            if chars1[k] != chars2[k] {
                cnt += 1
                if i == -1 {
                    i = k
                } else if j == -1 {
                    j = k
                }
            }
        }
        
        if cnt == 0 { return true }
        if cnt == 2 && chars1[i] == chars2[j] && chars1[j] == chars2[i] { return true }
        return false
    }
}

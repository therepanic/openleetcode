class Solution {
    func isPrefixString(_ s: String, _ words: [String]) -> Bool {
        var res = ""
        var i = 0
        while res.count < s.count {
            if i >= words.count { return false }
            res += words[i]
            i += 1
        }
        return res == s
    }
}

class Solution {
    func evaluate(_ s: String, _ knowledge: [[String]]) -> String {
        var mp = [String: String]()
        for pair in knowledge {
            mp[pair[0]] = pair[1]
        }
        var ans = ""
        let chars = Array(s)
        var i = 0
        let n = chars.count
        while i < n {
            if chars[i] == "(" {
                i += 1
                var temp = ""
                while i < n && chars[i] != ")" {
                    temp.append(chars[i])
                    i += 1
                }
                ans += mp[temp] ?? "?"
                i += 1
            } else {
                ans.append(chars[i])
                i += 1
            }
        }
        return ans
    }
}

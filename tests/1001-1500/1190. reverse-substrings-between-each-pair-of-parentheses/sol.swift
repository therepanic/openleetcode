class Solution {
    var i = 0

    func reverseParentheses(_ s: String) -> String {
        i = 0
        return helper(Array(s))
    }

    private func helper(_ s: [Character]) -> String {
        var ans = ""
        while i < s.count {
            if s[i] == "(" {
                i += 1
                ans += helper(s)
            } else if s[i] == ")" {
                i += 1
                return String(ans.reversed())
            } else {
                ans.append(s[i])
                i += 1
            }
        }
        return ans
    }
}

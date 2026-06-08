class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        let chars = Array(s)
        var i = chars.count - 1
        while i >= 0 && chars[i] == " " {
            i -= 1
        }

        var length = 0
        while i >= 0 && chars[i] != " " {
            length += 1
            i -= 1
        }
        return length
    }
}

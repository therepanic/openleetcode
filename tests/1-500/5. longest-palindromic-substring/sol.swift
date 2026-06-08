class Solution {
    func longestPalindrome(_ s: String) -> String {
        if s.isEmpty {
            return ""
        }

        let chars = Array(s)
        var start = 0
        var best = 1

        for i in 0..<chars.count {
            let len1 = expand(chars, i, i)
            let len2 = expand(chars, i, i + 1)
            let len = max(len1, len2)
            if len > best {
                best = len
                start = i - (len - 1) / 2
            }
        }

        return String(chars[start..<(start + best)])
    }

    private func expand(_ chars: [Character], _ left: Int, _ right: Int) -> Int {
        var l = left
        var r = right
        while l >= 0 && r < chars.count && chars[l] == chars[r] {
            l -= 1
            r += 1
        }
        return r - l - 1
    }
}

class Solution {
    func decodeAtIndex(_ s: String, _ k: Int) -> String {
        var size = 0
        for ch in s {
            if ch.isNumber {
                size *= Int(String(ch))!
            } else {
                size += 1
            }
        }

        var kk = k
        for ch in s.reversed() {
            kk %= size
            if kk == 0 && ch.isLetter {
                return String(ch)
            }
            if ch.isNumber {
                size /= Int(String(ch))!
            } else {
                size -= 1
            }
        }
        return ""
    }
}

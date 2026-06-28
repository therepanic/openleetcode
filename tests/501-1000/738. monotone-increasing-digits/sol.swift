class Solution {
    func monotoneIncreasingDigits(_ n: Int) -> Int {
        var s = Array(String(n))
        var mark = s.count
        var i = s.count - 1
        while i > 0 {
            if s[i] < s[i - 1] {
                s[i - 1] = Character(String(Int(String(s[i - 1]))! - 1))
                mark = i
            }
            i -= 1
        }
        for j in mark..<s.count {
            s[j] = "9"
        }
        return Int(String(s))!
    }
}

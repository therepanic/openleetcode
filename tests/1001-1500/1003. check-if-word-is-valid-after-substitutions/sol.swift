class Solution {
    func isValid(_ s: String) -> Bool {
        if s == "abc" {
            return true
        }
        if s.first != "a" || s.last != "c" {
            return false
        }
        var l = Array(s)
        for _ in 0..<l.count {
            var i = 0
            while i <= l.count - 3 {
                if l == ["a", "b", "c"] {
                    return true
                }
                if i + 2 <= l.count - 1 {
                    if l[i] == "a" && l[i+1] == "b" && l[i+2] == "c" {
                        l.remove(at: i)
                        l.remove(at: i)
                        l.remove(at: i)
                        i = -1
                    }
                }
                i += 1
            }
        }
        if l.count == 0 {
            return true
        }
        return false
    }
}

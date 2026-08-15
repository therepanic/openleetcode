class Solution {
    func halvesAreAlike(_ s: String) -> Bool {
        let vowels = "aeiouAEIOU"
        let mid = s.count / 2
        var count = 0
        let chars = Array(s)
        for i in 0..<mid {
            if vowels.contains(chars[i]) { count += 1 }
        }
        for i in mid..<chars.count {
            if vowels.contains(chars[i]) { count -= 1 }
        }
        return count == 0
    }
}

class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        var i = 0, j = 0
        while j < chars.count {
            let c = chars[j]
            var count = 0
            while j < chars.count && chars[j] == c {
                j += 1
                count += 1
            }
            chars[i] = c
            i += 1
            if count > 1 {
                for ch in String(count) {
                    chars[i] = ch
                    i += 1
                }
            }
        }
        return i
    }
}

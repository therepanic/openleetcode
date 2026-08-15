class Solution {
    func canBeTypedWords(_ text: String, _ brokenLetters: String) -> Int {
        var b = [Bool](repeating: false, count: 26)
        var res = 0

        for c in brokenLetters {
            b[Int(c.asciiValue! - 97)] = true
        }

        let words = text.split(separator: " ")
        for w in words {
            var ok = true
            for c in w {
                if b[Int(c.asciiValue! - 97)] {
                    ok = false
                    break
                }
            }
            if ok {
                res += 1
            }
        }

        return res
    }
}

class Solution {
    func numberOfLines(_ widths: [Int], _ s: String) -> [Int] {
        var lines = 1
        var current = 0
        for c in s {
            let w = widths[Int(c.asciiValue!) - 97]
            if current + w > 100 {
                lines += 1
                current = w
            } else {
                current += w
            }
        }
        return [lines, current]
    }
}

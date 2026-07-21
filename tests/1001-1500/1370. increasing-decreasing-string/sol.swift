class Solution {
    func sortString(_ s: String) -> String {
        if s.isEmpty { return "" }
        var counts = [Int](repeating: 0, count: 26)
        for c in s {
            counts[Int(c.asciiValue! - 97)] += 1
        }
        var ans = ""
        var added = true
        while added {
            added = false
            for i in 0..<26 {
                if counts[i] > 0 {
                    ans.append(Character(UnicodeScalar(i + 97)!))
                    counts[i] -= 1
                    added = true
                }
            }
            for i in (0..<26).reversed() {
                if counts[i] > 0 {
                    ans.append(Character(UnicodeScalar(i + 97)!))
                    counts[i] -= 1
                    added = true
                }
            }
        }
        return ans
    }
}

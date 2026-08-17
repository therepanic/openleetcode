class Solution {
    func getLucky(_ s: String, _ k: Int) -> Int {
        var res = ""
        for c in s.unicodeScalars {
            res += String(c.value - UnicodeScalar("a").value + 1)
        }
        for _ in 0..<k {
            var sum = 0
            for ch in res {
                sum += Int(String(ch)) ?? 0
            }
            res = String(sum)
        }
        return Int(res) ?? 0
    }
}

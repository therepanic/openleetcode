class Solution {
    func canConstruct(_ s: String, _ k: Int) -> Bool {
        if s.count < k {
            return false
        }

        var charCount = [Int](repeating: 0, count: 26)
        for c in s {
            charCount[Int(c.asciiValue! - 97)] += 1
        }

        let oddCount = charCount.filter { $0 % 2 != 0 }.count
        return oddCount <= k
    }
}

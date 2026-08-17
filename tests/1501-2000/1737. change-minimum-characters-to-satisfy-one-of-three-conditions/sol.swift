class Solution {
    func minCharacters(_ a: String, _ b: String) -> Int {
        var freqA = [Int](repeating: 0, count: 26)
        var freqB = [Int](repeating: 0, count: 26)

        for ch in a.utf8 {
            freqA[Int(ch) - 97] += 1
        }
        for ch in b.utf8 {
            freqB[Int(ch) - 97] += 1
        }

        let lenA = a.count
        let lenB = b.count
        var res = Int.max
        var sumA = 0, sumB = 0

        for i in 0..<25 {
            sumA += freqA[i]
            sumB += freqB[i]
            res = min(res, lenA - sumA + sumB)
            res = min(res, lenB - sumB + sumA)
        }

        for i in 0..<26 {
            res = min(res, (lenA - freqA[i]) + (lenB - freqB[i]))
        }

        return res
    }
}

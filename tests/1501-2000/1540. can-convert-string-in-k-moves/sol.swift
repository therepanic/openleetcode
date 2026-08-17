class Solution {
    func canConvertString(_ s: String, _ t: String, _ k: Int) -> Bool {
        if s.count != t.count { return false }
        let sArr = Array(s.utf8)
        let tArr = Array(t.utf8)
        var shiftCount = [Int](repeating: 0, count: 26)
        for i in 0..<sArr.count {
            if sArr[i] == tArr[i] { continue }
            let diff = (Int(tArr[i]) - Int(sArr[i]) + 26) % 26
            shiftCount[diff] += 1
            if diff + 26 * (shiftCount[diff] - 1) > k { return false }
        }
        return true
    }
}

class Solution {
    func shortestCompletingWord(_ licensePlate: String, _ words: [String]) -> String {
        var lp = [Int](repeating: 0, count: 26)
        for c in licensePlate.lowercased() {
            if c.isLetter {
                lp[Int(c.asciiValue! - 97)] += 1
            }
        }
        var ans: String?
        for w in words {
            var cw = [Int](repeating: 0, count: 26)
            for c in w {
                cw[Int(c.asciiValue! - 97)] += 1
            }
            var ok = true
            for i in 0..<26 {
                if cw[i] < lp[i] {
                    ok = false
                    break
                }
            }
            if ok && (ans == nil || w.count < ans!.count) {
                ans = w
            }
        }
        return ans!
    }
}

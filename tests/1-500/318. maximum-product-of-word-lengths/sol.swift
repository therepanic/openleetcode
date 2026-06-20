class Solution {
    func maxProduct(_ words: [String]) -> Int {
        let n = words.count
        var bitmasks = [Int](repeating: 0, count: n)
        for (i, w) in words.enumerated() {
            var mask = 0
            for c in w {
                mask |= 1 << (c.asciiValue! - Character("a").asciiValue!)
            }
            bitmasks[i] = mask
        }
        var maxProd = 0
        for i in 0..<n {
            for j in (i+1)..<n {
                if (bitmasks[i] & bitmasks[j]) == 0 {
                    maxProd = max(maxProd, words[i].count * words[j].count)
                }
            }
        }
        return maxProd
    }
}

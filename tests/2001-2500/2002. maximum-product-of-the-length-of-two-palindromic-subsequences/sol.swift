class Solution {
    func maxProduct(_ s: String) -> Int {
        let n = s.count
        let chars = Array(s)
        var palinMasks: [(mask: Int, len: Int)] = []
        
        for mask in 1..<(1 << n) {
            var seq = ""
            for i in 0..<n {
                if ((mask >> i) & 1) == 1 {
                    seq.append(chars[i])
                }
            }
            if seq == String(seq.reversed()) {
                let count = mask.nonzeroBitCount
                palinMasks.append((mask, count))
            }
        }
        
        var maxProduct = 0
        for i in 0..<palinMasks.count {
            for j in (i+1)..<palinMasks.count {
                let m1 = palinMasks[i].mask
                let m2 = palinMasks[j].mask
                let l1 = palinMasks[i].len
                let l2 = palinMasks[j].len
                if (m1 & m2) == 0 {
                    maxProduct = max(maxProduct, l1 * l2)
                }
            }
        }
        
        return maxProduct
    }
}

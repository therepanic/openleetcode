class Solution {
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        let req = 1 << k
        var seen = [Bool](repeating: false, count: req)
        let mask = req - 1
        var h = 0
        var remaining = req
        let chars = Array(s)

        for i in 0..<chars.count {
            h = ((h << 1) & mask) | (Int(chars[i].asciiValue!) & 1)

            if i >= k - 1 && !seen[h] {
                seen[h] = true
                remaining -= 1
                if remaining == 0 { return true }
            }
        }
        
        return false
    }
}

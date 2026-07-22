class Solution {
    func maxFreq(_ s: String, _ maxLetters: Int, _ minSize: Int, _ maxSize: Int) -> Int {
        var count = [String: Int]()
        var unique = [Character: Int]()
        var left = 0
        var res = 0
        let chars = Array(s)
        for right in 0..<chars.count {
            let rc = chars[right]
            unique[rc, default: 0] += 1

            while unique.count > maxLetters || right - left + 1 > minSize {
                let lc = chars[left]
                unique[lc, default: 0] -= 1
                if unique[lc] == 0 {
                    unique.removeValue(forKey: lc)
                }
                left += 1
            }

            if right - left + 1 == minSize && unique.count <= maxLetters {
                let curr = String(chars[left...right])
                count[curr, default: 0] += 1
                res = max(res, count[curr]!)
            }
        }
        return res
    }
}

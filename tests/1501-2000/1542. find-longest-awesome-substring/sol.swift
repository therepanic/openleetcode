class Solution {
    func longestAwesome(_ s: String) -> Int {
        let n = s.count
        var mask = [Int: Int]()
        var curMask = 0
        mask[curMask] = -1
        var ans = 1
        let chars = Array(s)
        for i in 0..<n {
            let num = Int(String(chars[i]))!
            curMask ^= (1 << num)
            let needMask = curMask
            if let val = mask[needMask] {
                ans = max(ans, i - val)
            }
            for bit in 0..<10 {
                let nNeedMax = needMask ^ (1 << bit)
                if let val = mask[nNeedMax] {
                    ans = max(ans, i - val)
                }
            }
            if mask[curMask] == nil {
                mask[curMask] = i
            }
        }
        return ans
    }
}

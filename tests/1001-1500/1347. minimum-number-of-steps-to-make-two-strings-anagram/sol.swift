class Solution {
    func minSteps(_ s: String, _ t: String) -> Int {
        var dic = [Character: Int]()
        for ch in t {
            dic[ch, default: 0] += 1
        }
        for ch in s {
            if let count = dic[ch], count > 0 {
                dic[ch] = count - 1
            }
        }
        return dic.values.reduce(0, +)
    }
}

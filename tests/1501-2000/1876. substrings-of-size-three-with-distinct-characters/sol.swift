class Solution {
    func countGoodSubstrings(_ s: String) -> Int {
        let chars = Array(s)
        var count = 0
        if chars.count < 3 { return 0 }
        for i in 0..<(chars.count-2) {
            if chars[i] != chars[i+1] && chars[i+1] != chars[i+2] && chars[i] != chars[i+2] {
                count += 1
            }
        }
        return count
    }
}

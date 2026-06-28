class Solution {
    func countSubstrings(_ s: String) -> Int {
        var count = 0
        let chars = Array(s)
        
        func expand(_ left: Int, _ right: Int) -> Int {
            var l = left
            var r = right
            var res = 0
            while l >= 0 && r < chars.count && chars[l] == chars[r] {
                res += 1
                l -= 1
                r += 1
            }
            return res
        }
        
        for i in 0..<chars.count {
            count += expand(i, i)
            count += expand(i, i + 1)
        }
        
        return count
    }
}

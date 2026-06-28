class Solution {
    func letterCasePermutation(_ s: String) -> [String] {
        var ans: [String] = []
        let chars = Array(s)
        
        func solve(_ idx: Int, _ curr: String) {
            if idx == chars.count {
                ans.append(curr)
                return
            }
            if chars[idx].isNumber {
                solve(idx + 1, curr + String(chars[idx]))
                return
            }
            solve(idx + 1, curr + chars[idx].lowercased())
            solve(idx + 1, curr + chars[idx].uppercased())
        }
        
        solve(0, "")
        return ans
    }
}

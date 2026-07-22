class Solution {
    func longestSubsequence(_ arr: [Int], _ difference: Int) -> Int {
        var dic = [Int: Int]()
        var maxLen = 0
        for x in arr {
            if let val = dic[x - difference] {
                dic[x] = val + 1
            } else {
                dic[x] = 1
            }
            if dic[x]! > maxLen {
                maxLen = dic[x]!
            }
        }
        return maxLen
    }
}

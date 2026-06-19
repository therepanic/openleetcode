class Solution {
    func longestPalindrome(_ s: String) -> Int {
        var count: [Character: Int] = [:]
        for c in s {
            count[c, default: 0] += 1
        }
        
        var maxLen = 0
        var odd = false
        
        for freq in count.values {
            if freq % 2 == 0 {
                maxLen += freq
            } else {
                maxLen += freq - 1
                odd = true
            }
        }
        
        return maxLen + (odd ? 1 : 0)
    }
}

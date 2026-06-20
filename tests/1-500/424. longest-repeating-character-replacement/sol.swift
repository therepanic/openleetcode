class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var maxCount = 0
        var left = 0
        var freq = [Character: Int]()
        let chars = Array(s)
        
        for right in 0..<chars.count {
            freq[chars[right], default: 0] += 1
            maxCount = max(maxCount, freq[chars[right]]!)
            
            if right - left + 1 - maxCount > k {
                freq[chars[left]]! -= 1
                left += 1
            }
        }
        
        return chars.count - left
    }
}

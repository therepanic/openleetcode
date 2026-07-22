class Solution {
    func maxRepOpt1(_ text: String) -> Int {
        var total = [Character: Int]()
        for c in text {
            total[c, default: 0] += 1
        }
        let n = text.count
        var ans = 0
        let chars = Array(text)
        
        for (ch, chTotal) in total {
            var left = 0
            var count = 0
            
            for right in 0..<n {
                if chars[right] == ch {
                    count += 1
                }
                
                while (right - left + 1) - count > 1 {
                    if chars[left] == ch {
                        count -= 1
                    }
                    left += 1
                }
                
                ans = max(ans, min(right - left + 1, chTotal))
            }
        }
        
        return ans
    }
}

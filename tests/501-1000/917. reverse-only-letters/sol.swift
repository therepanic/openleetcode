class Solution {
    func reverseOnlyLetters(_ s: String) -> String {
        var chars = Array(s)
        var start = 0
        var end = chars.count - 1
        while true {
            if start >= end {
                break
            }
            
            if chars[start].isLetter && chars[end].isLetter {
                chars.swapAt(start, end)
                start += 1
                end -= 1
            } else if !chars[start].isLetter {
                start += 1
            } else {
                end -= 1
            }
        }
        
        return String(chars)
    }
}

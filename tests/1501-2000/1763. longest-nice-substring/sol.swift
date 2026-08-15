class Solution {
    func longestNiceSubstring(_ s: String) -> String {
        let lenS = s.count
        if lenS <= 1 { return "" }

        var charToFreqMap: [Character: Int] = [:]
        for c in s {
            charToFreqMap[c, default: 0] += 1
        }
        
        var isBroken = false
        var i = 0
        let chars = Array(s)
        while (i < chars.count) {
            let ch = chars[i]
            if ch.isLowercase && charToFreqMap[ch.uppercased().first!] != nil {
                // pass
            } else if ch.isUppercase && charToFreqMap[ch.lowercased().first!] != nil {
                // pass
            } else {
                isBroken = true
                break
            }
            i += 1
        }

        if !isBroken { return s }
        
        let index = chars.index(chars.startIndex, offsetBy: i)
        let stringArray = Array(s)
        let left = String(stringArray[0..<i])
        let right = String(stringArray[(i+1)...])
        
        let longestNiceSubstr1 = longestNiceSubstring(left)
        let longestNiceSubstr2 = longestNiceSubstring(right)
        
        return longestNiceSubstr1.count >= longestNiceSubstr2.count ? longestNiceSubstr1 : longestNiceSubstr2
    }
}

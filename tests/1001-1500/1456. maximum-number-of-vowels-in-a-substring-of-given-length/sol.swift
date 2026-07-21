class Solution {
    private func isVowel(_ c: Character) -> Bool {
        return c == "a" || c == "e" || c == "i" || c == "o" || c == "u"
    }
    
    func maxVowels(_ s: String, _ k: Int) -> Int {
        var maxVowel = 0
        var left = 0
        var vowel = 0
        let chars = Array(s)
        
        for right in 0..<chars.count {
            if isVowel(chars[right]) {
                vowel += 1
            }
            
            if (right - left + 1) == k {
                maxVowel = max(maxVowel, vowel)
                if isVowel(chars[left]) {
                    vowel -= 1
                }
                left += 1
            }
        }
        
        return maxVowel
    }
}

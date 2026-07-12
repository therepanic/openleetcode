class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        if str1 + str2 != str2 + str1 {
            return ""
        }
        
        func gcd(_ len1: Int, _ len2: Int) -> Int {
            let minVal = min(len1, len2)
            for i in stride(from: minVal, through: 1, by: -1) {
                if len1 % i == 0 && len2 % i == 0 {
                    return i
                }
            }
            return 1
        }
        
        let idx = str1.index(str1.startIndex, offsetBy: gcd(str1.count, str2.count))
        return String(str1[..<idx])
    }
}

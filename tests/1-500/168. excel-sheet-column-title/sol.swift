class Solution {
    func convertToTitle(_ columnNumber: Int) -> String {
        var n = columnNumber
        var chars: [Character] = []
        while n > 0 {
            n -= 1
            let scalar = UnicodeScalar(65 + n % 26)!
            chars.append(Character(scalar))
            n /= 26
        }
        return String(chars.reversed())
    }
}

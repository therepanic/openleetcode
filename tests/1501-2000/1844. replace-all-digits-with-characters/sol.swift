class Solution {
    func replaceDigits(_ s: String) -> String {
        var chars = Array(s)
        for i in stride(from: 1, through: chars.count - 1, by: 2) {
            let ch = chars[i - 1]
            let digit = Int(String(chars[i]))!
            chars[i] = Character(UnicodeScalar(Int(ch.asciiValue!) + digit)!)
        }
        return String(chars)
    }
}

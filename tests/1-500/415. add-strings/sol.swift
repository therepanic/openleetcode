class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        var result: [Character] = []
        var carry = 0
        var i = num1.count - 1, j = num2.count - 1
        let num1Chars = Array(num1)
        let num2Chars = Array(num2)
        
        while i >= 0 || j >= 0 || carry > 0 {
            let digit1 = i >= 0 ? Int(num1Chars[i].asciiValue! - Character("0").asciiValue!) : 0
            let digit2 = j >= 0 ? Int(num2Chars[j].asciiValue! - Character("0").asciiValue!) : 0
            
            let total = digit1 + digit2 + carry
            carry = total / 10
            result.append(Character(UnicodeScalar(total % 10 + Int(Character("0").asciiValue!))!))
            
            i -= 1
            j -= 1
        }
        
        return String(result.reversed())
    }
}

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        let openParen: Character = "("
        let openBracket: Character = "["
        let openBrace: Character = "{"
        let closeParen: Character = ")"
        let closeBracket: Character = "]"
        let closeBrace: Character = "}"
        for ch in s {
            if ch == openParen || ch == openBracket || ch == openBrace {
                stack.append(ch)
            } else {
                if stack.isEmpty { return false }
                let top = stack.removeLast()
                if ch == closeParen && top != openParen { return false }
                if ch == closeBracket && top != openBracket { return false }
                if ch == closeBrace && top != openBrace { return false }
            }
        }
        return stack.isEmpty
    }
}

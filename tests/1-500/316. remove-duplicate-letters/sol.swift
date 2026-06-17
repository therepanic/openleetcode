class Solution {
    func removeDuplicateLetters(_ s: String) -> String {
        var lastOccur: [Character: Int] = [:]
        let chars = Array(s)
        
        for i in 0..<chars.count {
            lastOccur[chars[i]] = i
        }
        
        var stack: [Character] = []
        var visited: Set<Character> = []
        
        for i in 0..<chars.count {
            let char = chars[i]
            if visited.contains(char) {
                continue
            }
            
            while !stack.isEmpty && char < stack.last! && i < (lastOccur[stack.last!] ?? -1) {
                visited.remove(stack.removeLast())
            }
            
            visited.insert(char)
            stack.append(char)
        }
        
        return String(stack)
    }
}

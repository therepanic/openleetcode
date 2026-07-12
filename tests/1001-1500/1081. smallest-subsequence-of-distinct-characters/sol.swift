class Solution {
    func smallestSubsequence(_ s: String) -> String {
        var fqMap = [Character: Int]()
        var stack = [Character]()
        var visited = Set<Character>()
        for ch in s {
            fqMap[ch, default: 0] += 1
        }
        for ch in s {
            fqMap[ch]! -= 1
            if visited.contains(ch) {
                continue
            }
            while !stack.isEmpty, ch < stack.last!, fqMap[stack.last!]! > 0 {
                visited.remove(stack.removeLast())
            }
            visited.insert(ch)
            stack.append(ch)
        }
        return String(stack)
    }
}

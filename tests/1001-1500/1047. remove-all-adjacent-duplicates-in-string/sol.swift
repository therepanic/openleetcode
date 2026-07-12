class Solution {
    func removeDuplicates(_ s: String) -> String {
        var stack = [Character]()
        for char in s {
            if let last = stack.last, last == char {
                stack.removeLast()
            } else {
                stack.append(char)
            }
        }
        return String(stack)
    }
}

class Solution {
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        var stack: [(Character, Int)] = []
        for char in s {
            if !stack.isEmpty && stack.last!.0 == char {
                stack[stack.count - 1].1 += 1
            } else {
                stack.append((char, 1))
            }
            if stack.last!.1 == k {
                stack.removeLast()
            }
        }
        var result = ""
        for (char, count) in stack {
            result += String(repeating: char, count: count)
        }
        return result
    }
}

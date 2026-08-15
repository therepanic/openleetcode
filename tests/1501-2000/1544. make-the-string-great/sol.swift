class Solution {
    func makeGood(_ s: String) -> String {
        var stack: [Character] = []
        for ch in s {
            if let last = stack.last, ch.lowercased() == last.lowercased() && ch != last {
                stack.removeLast()
            } else {
                stack.append(ch)
            }
        }
        return String(stack)
    }
}

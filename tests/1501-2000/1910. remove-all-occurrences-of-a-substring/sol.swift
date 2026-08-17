class Solution {
    func removeOccurrences(_ s: String, _ part: String) -> String {
        var result_stack: [Character] = []
        let target_length = part.count
        let target_end_char = part.last!

        for current_char in s {
            result_stack.append(current_char)

            if current_char == target_end_char && result_stack.count >= target_length {
                if String(result_stack[(result_stack.count - target_length)..<result_stack.count]) == part {
                    result_stack.removeLast(target_length)
                }
            }
        }

        return String(result_stack)
    }
}

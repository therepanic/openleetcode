class Solution {
    fun removeOccurrences(s: String, part: String): String {
        val result_stack = StringBuilder()
        val target_length = part.length
        val target_end_char = part.last()

        for (current_char in s) {
            result_stack.append(current_char)

            if (current_char == target_end_char && result_stack.length >= target_length) {
                if (result_stack.substring(result_stack.length - target_length) == part) {
                    result_stack.delete(result_stack.length - target_length, result_stack.length)
                }
            }
        }

        return result_stack.toString()
    }
}

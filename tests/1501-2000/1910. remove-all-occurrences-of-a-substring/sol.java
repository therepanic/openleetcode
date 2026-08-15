class Solution {
    public String removeOccurrences(String s, String part) {
        StringBuilder result_stack = new StringBuilder();
        int target_length = part.length();
        char target_end_char = part.charAt(target_length - 1);

        for (char current_char : s.toCharArray()) {
            result_stack.append(current_char);

            if (current_char == target_end_char && result_stack.length() >= target_length) {
                if (result_stack.substring(result_stack.length() - target_length).equals(part)) {
                    result_stack.delete(result_stack.length() - target_length, result_stack.length());
                }
            }
        }

        return result_stack.toString();
    }
}

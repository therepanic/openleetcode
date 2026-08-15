public class Solution {
    public string RemoveOccurrences(string s, string part) {
        var result_stack = new System.Text.StringBuilder();
        int target_length = part.Length;
        char target_end_char = part[target_length - 1];

        foreach (char current_char in s) {
            result_stack.Append(current_char);

            if (current_char == target_end_char && result_stack.Length >= target_length) {
                if (result_stack.ToString(result_stack.Length - target_length, target_length) == part) {
                    result_stack.Length -= target_length;
                }
            }
        }

        return result_stack.ToString();
    }
}

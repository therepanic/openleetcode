class Solution {
public:
    string removeOccurrences(string s, string part) {
        string result_stack;
        int target_length = part.length();
        char target_end_char = part.back();

        for (char current_char : s) {
            result_stack.push_back(current_char);

            if (current_char == target_end_char && result_stack.length() >= target_length) {
                if (result_stack.substr(result_stack.length() - target_length) == part) {
                    result_stack.erase(result_stack.length() - target_length, target_length);
                }
            }
        }

        return result_stack;
    }
};

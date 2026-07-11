class Solution {
public:
    int scoreOfParentheses(string s) {
        vector<int> score_stack = {0};
        
        for (char parentheses : s) {
            if (parentheses == '(') {
                score_stack.push_back(0);
            } else if (!score_stack.empty()) {
                int last_score = score_stack.back();
                score_stack.pop_back();
                score_stack.back() += max(1, last_score * 2);
            }
        }
        
        return score_stack.back();
    }
};

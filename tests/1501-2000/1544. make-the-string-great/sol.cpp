class Solution {
public:
    string makeGood(string s) {
        vector<char> stack;
        for (char ch : s) {
            if (!stack.empty() && tolower(ch) == tolower(stack.back()) && ch != stack.back()) {
                stack.pop_back();
            } else {
                stack.push_back(ch);
            }
        }
        return string(stack.begin(), stack.end());
    }
};

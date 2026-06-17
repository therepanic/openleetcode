class Solution {
public:
    vector<string> removeInvalidParentheses(string s) {
        auto isValid = [](const string& str) {
            int ctr = 0;
            for (char ch : str) {
                if (ch == '(') {
                    ctr++;
                } else if (ch == ')') {
                    if (ctr == 0) return false;
                    ctr--;
                }
            }
            return ctr == 0;
        };
        
        unordered_set<string> level = {s};
        while (true) {
            vector<string> valid;
            for (const auto& str : level) {
                if (isValid(str)) {
                    valid.push_back(str);
                }
            }
            if (!valid.empty()) return valid;
            
            unordered_set<string> nextLevel;
            for (const auto& str : level) {
                for (int i = 0; i < str.length(); i++) {
                    nextLevel.insert(str.substr(0, i) + str.substr(i + 1));
                }
            }
            level = nextLevel;
        }
    }
};

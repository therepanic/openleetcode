class Solution {
public:
    int minInsertions(string s) {
        vector<char> stack;
        int count = 0;
        int i = 0;
        
        while (i < s.length()) {
            if (s[i] == '(') {
                stack.push_back('(');
            } else {
                if (stack.empty()) {
                    if (i != s.length() - 1 && s[i + 1] == ')') {
                        count += 1;
                        i++;
                    } else {
                        count += 2;
                    }
                } else {
                    if (i != s.length() - 1 && s[i + 1] == ')') {
                        stack.pop_back();
                        i++;
                    } else {
                        count += 1;
                        stack.pop_back();
                    }
                }
            }
            i++;
        }
        
        return count + stack.size() * 2;
    }
};

class Solution {
public:
    string reverseParentheses(string s) {
        i = 0;
        return helper(s);
    }

private:
    int i;

    string helper(const string& s) {
        string ans;
        while (i < s.size()) {
            if (s[i] == '(') {
                i++;
                ans += helper(s);
            } else if (s[i] == ')') {
                i++;
                reverse(ans.begin(), ans.end());
                return ans;
            } else {
                ans += s[i];
                i++;
            }
        }
        return ans;
    }
};

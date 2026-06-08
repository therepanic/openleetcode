class Solution {
public:
    int longestValidParentheses(string s) {
        vector<int> st = {-1};
        int ans = 0;
        for (int i = 0; i < (int)s.size(); ++i) {
            if (s[i] == '(') {
                st.push_back(i);
            } else {
                st.pop_back();
                if (st.empty()) st.push_back(i);
                else ans = max(ans, i - st.back());
            }
        }
        return ans;
    }
};

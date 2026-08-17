class Solution {
public:
    int maxDepth(string s) {
        int ctr = 0;
        int ans = 0;
        for (char ch : s) {
            if (ch == '(') {
                ctr++;
                ans = max(ans, ctr);
            } else if (ch == ')') {
                ctr--;
            }
        }
        return ans;
    }
};

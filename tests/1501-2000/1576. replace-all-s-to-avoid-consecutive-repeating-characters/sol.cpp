class Solution {
public:
    string modifyString(string s) {
        int n = s.size();
        for (int i = 0; i < n; i++) {
            if (s[i] == '?') {
                char left = i > 0 ? s[i-1] : ' ';
                char right = i+1 < n ? s[i+1] : ' ';
                if (left != 'a' && right != 'a') {
                    s[i] = 'a';
                } else if (left != 'b' && right != 'b') {
                    s[i] = 'b';
                } else {
                    s[i] = 'c';
                }
            }
        }
        return s;
    }
};

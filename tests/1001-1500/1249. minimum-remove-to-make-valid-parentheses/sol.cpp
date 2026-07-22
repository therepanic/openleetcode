class Solution {
public:
    string minRemoveToMakeValid(string s) {
        string t;
        int p = 0;
        for (char c : s) {
            if (c == '(') p++;
            else if (c == ')') p--;
            if (p >= 0) {
                t.push_back(c);
            } else {
                p = 0;
            }
        }
        p = 0;
        string result;
        for (int i = t.length() - 1; i >= 0; i--) {
            char c = t[i];
            if (c == '(') p++;
            else if (c == ')') p--;
            if (p <= 0) {
                result.push_back(c);
            } else {
                p = 0;
            }
        }
        reverse(result.begin(), result.end());
        return result;
    }
};

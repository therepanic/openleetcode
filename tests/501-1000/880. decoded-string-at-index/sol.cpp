class Solution {
public:
    string decodeAtIndex(string s, int k) {
        long long size = 0;
        for (char ch : s) {
            if (isdigit(ch)) {
                size *= ch - '0';
            } else {
                size++;
            }
        }

        for (int i = s.length() - 1; i >= 0; i--) {
            char ch = s[i];
            k %= size;
            if (k == 0 && isalpha(ch)) {
                return string(1, ch);
            }
            if (isdigit(ch)) {
                size /= ch - '0';
            } else {
                size--;
            }
        }
        return "";
    }
};

class Solution {
public:
    string longestPalindrome(string s) {
        if (s.empty()) return "";

        int start = 0;
        int best = 1;
        for (int i = 0; i < (int)s.size(); ++i) {
            int len1 = expand(s, i, i);
            int len2 = expand(s, i, i + 1);
            int len = len1 > len2 ? len1 : len2;
            if (len > best) {
                best = len;
                start = i - (len - 1) / 2;
            }
        }
        return s.substr(start, best);
    }

private:
    int expand(const string& s, int left, int right) {
        while (left >= 0 && right < (int)s.size() && s[left] == s[right]) {
            --left;
            ++right;
        }
        return right - left - 1;
    }
};

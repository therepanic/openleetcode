class Solution {
public:
    string reverseStr(string s, int k) {
        int step = 2 * k;
        for (int i = 0; i < s.size(); i += step) {
            int start = i;
            int end = min(i + k - 1, (int)s.size() - 1);
            while (start < end) {
                swap(s[start], s[end]);
                start++;
                end--;
            }
        }
        return s;
    }
};

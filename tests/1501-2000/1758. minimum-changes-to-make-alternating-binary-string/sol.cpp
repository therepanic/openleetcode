class Solution {
public:
    int minOperations(string s) {
        int c = 0, j = 0, n = s.length();
        for (char ch : s) {
            if (ch - '0' == j) {
                c++;
            }
            j ^= 1;
        }
        return min(c, n - c);
    }
};

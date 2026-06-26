class Solution {
public:
    int findLUSlength(string a, string b) {
        if (a == b) {
            return -1;
        } else {
            return max(a.length(), b.length());
        }
    }
};

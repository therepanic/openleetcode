class Solution {
public:
    int numberOfSubstrings(string s) {
        int res = 0;
        int p[4] = {50000, -1, -1, -1};
        for (int i = 0; i < s.size(); i++) {
            p[s[i] & 31] = i;
            res += min({p[1], p[2], p[3]}) + 1;
        }
        return res;
    }
};

class Solution {
public:
    bool isIsomorphic(string s, string t) {
        vector<int> st(256, -1), ts(256, -1);
        for (int i = 0; i < (int)s.size(); i++) {
            unsigned char a = s[i], b = t[i];
            if (st[a] != ts[b]) return false;
            st[a] = ts[b] = i;
        }
        return true;
    }
};

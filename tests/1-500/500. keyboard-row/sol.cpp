class Solution {
public:
    vector<string> findWords(vector<string>& words) {
        unordered_map<char, int> m;
        for (char c : "qwertyuiop") m[c] = 1;
        for (char c : "asdfghjkl") m[c] = 2;
        for (char c : "zxcvbnm") m[c] = 3;
        vector<string> ans;
        for (const string& w : words) {
            string lw = w;
            transform(lw.begin(), lw.end(), lw.begin(), ::tolower);
            int r = m[lw[0]];
            bool ok = true;
            for (char ch : lw) {
                if (m[ch] != r) {
                    ok = false;
                    break;
                }
            }
            if (ok) ans.push_back(w);
        }
        return ans;
    }
};

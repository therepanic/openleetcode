class Solution {
public:
    int canBeTypedWords(string text, string brokenLetters) {
        vector<bool> b(26, false);
        int res = 0;

        for (char c : brokenLetters) {
            b[c - 'a'] = true;
        }

        stringstream ss(text);
        string w;
        while (ss >> w) {
            bool ok = true;
            for (char c : w) {
                if (b[c - 'a']) {
                    ok = false;
                    break;
                }
            }
            if (ok) {
                res++;
            }
        }

        return res;
    }
};

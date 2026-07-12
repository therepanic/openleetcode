class Solution {
public:
    int expressiveWords(string s, vector<string>& words) {
        auto encode = [](const string& x) -> pair<vector<char>, vector<int>> {
            vector<char> chars;
            vector<int> cnts;
            char prev = 0;
            int c = 0;
            for (char ch : x) {
                if (ch == prev) {
                    c++;
                } else {
                    if (prev != 0) {
                        chars.push_back(prev);
                        cnts.push_back(c);
                    }
                    prev = ch;
                    c = 1;
                }
            }
            if (prev != 0) {
                chars.push_back(prev);
                cnts.push_back(c);
            }
            return {chars, cnts};
        };
        
        auto [s_chars, s_cnts] = encode(s);
        int ans = 0;
        for (const string& w : words) {
            auto [w_chars, w_cnts] = encode(w);
            if (s_chars != w_chars) continue;
            bool ok = true;
            for (size_t i = 0; i < s_cnts.size(); i++) {
                int sc = s_cnts[i], wc = w_cnts[i];
                if (sc < wc || (sc < 3 && sc != wc)) {
                    ok = false;
                    break;
                }
            }
            if (ok) ans++;
        }
        return ans;
    }
};

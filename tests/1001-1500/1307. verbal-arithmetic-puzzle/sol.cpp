class Solution {
public:
    bool isSolvable(vector<string>& words, string result) {
        unordered_set<char> zeroes;
        int m = 0;
        for (const auto& word : words) {
            if (word.length() > 1) {
                zeroes.insert(word[0]);
            }
            m = max(m, (int)word.length());
        }
        if (m > result.length()) return false;
        
        unordered_map<char, int> d;
        for (const auto& word : words) {
            for (char c : word) {
                d[c] = -1;
            }
        }
        for (char c : result) {
            d[c] = -1;
        }
        
        vector<string> wordsRev;
        for (const auto& word : words) {
            string rev = word;
            reverse(rev.begin(), rev.end());
            wordsRev.push_back(rev);
        }
        reverse(result.begin(), result.end());
        string resultRev = result;
        int R = resultRev.length();
        int N = wordsRev.size();
        unordered_set<int> visited = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
        
        function<bool(int, int, int)> rec = [&](int wi, int ri, int rem) -> bool {
            if (ri == R) {
                return rem == 0 && (resultRev.length() == 1 || d[resultRev[R-1]] != 0);
            }
            if (wi == N) {
                if (d[resultRev[ri]] != -1) {
                    if (d[resultRev[ri]] != rem % 10) return false;
                    return rec(0, ri + 1, rem / 10);
                } else if (visited.count(rem % 10)) {
                    int val = rem % 10;
                    visited.erase(val);
                    d[resultRev[ri]] = val;
                    bool ret = rec(wi, ri, rem);
                    d[resultRev[ri]] = -1;
                    visited.insert(val);
                    if (ret) return true;
                }
                return false;
            }
            if (wordsRev[wi].length() <= ri) {
                return rec(wi + 1, ri, rem);
            }
            if (d[wordsRev[wi][ri]] != -1) {
                return rec(wi + 1, ri, rem + d[wordsRev[wi][ri]]);
            }
            for (int val = 0; val < 10; val++) {
                if (visited.count(val) && (val != 0 || !zeroes.count(wordsRev[wi][ri]))) {
                    visited.erase(val);
                    d[wordsRev[wi][ri]] = val;
                    bool ret = rec(wi + 1, ri, rem + val);
                    d[wordsRev[wi][ri]] = -1;
                    visited.insert(val);
                    if (ret) return true;
                }
            }
            return false;
        };
        
        return rec(0, 0, 0);
    }
};

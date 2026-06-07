class Solution {
public:
    unordered_map<string, bool> memo;

    bool isScramble(string s1, string s2) {
        if (s1 == s2) return true;
        string key = s1 + "#" + s2;
        auto it = memo.find(key);
        if (it != memo.end()) return it->second;
        int cnt[26] = {0};
        for (char ch : s1) ++cnt[ch - 'a'];
        for (char ch : s2) --cnt[ch - 'a'];
        for (int x : cnt) if (x != 0) return memo[key] = false;
        int n = (int)s1.size();
        for (int i = 1; i < n; ++i) {
            if (isScramble(s1.substr(0, i), s2.substr(0, i)) && isScramble(s1.substr(i), s2.substr(i))) return memo[key] = true;
            if (isScramble(s1.substr(0, i), s2.substr(n - i)) && isScramble(s1.substr(i), s2.substr(0, n - i))) return memo[key] = true;
        }
        return memo[key] = false;
    }
};

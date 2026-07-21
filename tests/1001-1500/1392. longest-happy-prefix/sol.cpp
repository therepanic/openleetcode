class Solution {
public:
    string longestPrefix(string s) {
        int n = s.size();
        vector<int> prefix(n, 0);
        int matched = 0;
        for (int i = 1; i < n; i++) {
            while (matched > 0 && s[i] != s[matched]) {
                matched = prefix[matched - 1];
            }
            if (s[i] == s[matched]) {
                matched++;
            }
            prefix[i] = matched;
        }
        return s.substr(0, prefix[n - 1]);
    }
};

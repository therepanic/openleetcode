class Solution {
public:
    int countHomogenous(string s) {
        const int mod = 1000000007;
        int n = s.length();
        long long res = 1;
        int cnt = 1;
        for (int i = 1; i < n; i++) {
            if (s[i] != s[i - 1]) {
                cnt = 0;
            }
            cnt++;
            res = (res + cnt) % mod;
        }
        return (int) res;
    }
};

class Solution {
public:
    int distinctEchoSubstrings(string text) {
        int n = text.size();
        using ll = long long;
        ll b1 = 911382323, b2 = 972663749;
        ll m1 = 1000000007, m2 = 1000000009;
        vector<ll> p1(n + 1, 1), p2(n + 1, 1);
        vector<ll> h1(n + 1, 0), h2(n + 1, 0);
        int a = 'a';
        for (int i = 1; i <= n; i++) {
            int v = text[i - 1] - a;
            p1[i] = (p1[i - 1] * b1) % m1;
            p2[i] = (p2[i - 1] * b2) % m2;
            h1[i] = (h1[i - 1] * b1 + v) % m1;
            h2[i] = (h2[i - 1] * b2 + v) % m2;
        }
        auto get = [&](int l, int r) -> pair<ll, ll> {
            ll v1 = (h1[r] - h1[l] * p1[r - l]) % m1;
            ll v2 = (h2[r] - h2[l] * p2[r - l]) % m2;
            if (v1 < 0) v1 += m1;
            if (v2 < 0) v2 += m2;
            return {v1, v2};
        };
        set<pair<int, pair<ll, ll>>> st;
        for (int i = 0; i < n; i++) {
            int maxLen = (n - i) / 2;
            for (int L = 1; L <= maxLen; L++) {
                if (get(i, i + L) == get(i + L, i + 2 * L)) {
                    st.insert({2 * L, get(i, i + 2 * L)});
                }
            }
        }
        return st.size();
    }
};

class Solution {
public:
    int uniqueLetterString(string s) {
        int n = s.size();
        vector<int> left(n, 0);
        vector<int> right(n, 0);
        vector<int> prev(26, -1);

        for (int i = 0; i < n; i++) {
            int idx = s[i] - 'A';
            left[i] = prev[idx];
            prev[idx] = i;
        }

        prev.assign(26, n);

        for (int i = n - 1; i >= 0; i--) {
            int idx = s[i] - 'A';
            right[i] = prev[idx];
            prev[idx] = i;
        }

        int ans = 0;
        for (int i = 0; i < n; i++) {
            ans += (i - left[i]) * (right[i] - i);
        }
        return ans;
    }
};

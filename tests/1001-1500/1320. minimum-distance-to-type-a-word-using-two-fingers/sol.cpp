class Solution {
private:
    int cal(int a, int b) {
        return abs(a / 6 - b / 6) + abs(a % 6 - b % 6);
    }

public:
    int minimumDistance(string word) {
        int n = word.length();
        vector<int> dp(26, 0);
        vector<int> ndp(26, 0);

        for (int i = 1; i < n; i++) {
            int p = word[i - 1] - 'A';
            int t = word[i] - 'A';

            for (int j = 0; j < 26; j++) {
                ndp[j] = dp[j] + cal(p, t);
            }

            for (int j = 0; j < 26; j++) {
                ndp[p] = min(ndp[p], dp[j] + cal(j, t));
            }

            swap(dp, ndp);
        }

        return *min_element(dp.begin(), dp.end());
    }
};

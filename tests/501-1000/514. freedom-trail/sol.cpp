class Solution {
private:
    int dist(int size, int p, int t) {
        return min(abs(t - p), size - abs(t - p));
    }
    
public:
    int findRotateSteps(string ring, string key) {
        int mp[26][100] = {};
        int freq[26] = {};
        int dp[100][100] = {};
        
        int n = ring.size();
        int m = key.size();
        
        for (int i = 0; i < n; i++) {
            int idx = ring[i] - 'a';
            mp[idx][freq[idx]] = i;
            freq[idx]++;
        }
        
        int firstChar = key[0] - 'a';
        for (int i = 0; i < freq[firstChar]; i++) {
            dp[0][mp[firstChar][i]] = dist(n, 0, mp[firstChar][i]) + 1;
        }
        
        for (int i = 1; i < m; i++) {
            int prevChar = key[i - 1] - 'a';
            int currChar = key[i] - 'a';
            for (int j = 0; j < freq[currChar]; j++) {
                int mini = INT_MAX;
                for (int k = 0; k < freq[prevChar]; k++) {
                    mini = min(mini, dp[i - 1][mp[prevChar][k]] +
                              dist(n, mp[currChar][j], mp[prevChar][k]) + 1);
                }
                dp[i][mp[currChar][j]] = mini;
            }
        }
        
        int lastChar = key[m - 1] - 'a';
        int res = INT_MAX;
        for (int i = 0; i < freq[lastChar]; i++) {
            res = min(res, dp[m - 1][mp[lastChar][i]]);
        }
        
        return res;
    }
};

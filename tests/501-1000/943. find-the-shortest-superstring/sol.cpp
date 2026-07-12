class Solution {
public:
    string shortestSuperstring(vector<string>& words) {
        int n = words.size();
        vector<vector<int>> overlap(n, vector<int>(n, 0));
        
        auto getOverlap = [](const string& a, const string& b) {
            int maxOlap = 0;
            for (int k = 1; k <= min(a.size(), b.size()); k++) {
                if (a.substr(a.size() - k) == b.substr(0, k)) {
                    maxOlap = max(maxOlap, k);
                }
            }
            return maxOlap;
        };
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (i != j) {
                    overlap[i][j] = getOverlap(words[i], words[j]);
                }
            }
        }
        
        vector<vector<string>> dp(1 << n, vector<string>(n, ""));
        for (int i = 0; i < n; i++) {
            dp[1 << i][i] = words[i];
        }
        
        for (int mask = 0; mask < (1 << n); mask++) {
            for (int u = 0; u < n; u++) {
                if (!(mask & (1 << u))) continue;
                for (int v = 0; v < n; v++) {
                    if (mask & (1 << v)) continue;
                    int newMask = mask | (1 << v);
                    string candidate = dp[mask][u] + words[v].substr(overlap[u][v]);
                    if (dp[newMask][v].empty() || candidate.size() < dp[newMask][v].size()) {
                        dp[newMask][v] = candidate;
                    }
                }
            }
        }
        
        string shortest = "";
        for (const string& candidate : dp[(1 << n) - 1]) {
            if (shortest.empty() || candidate.size() < shortest.size()) {
                shortest = candidate;
            }
        }
        return shortest;
    }
};

class Solution {
public:
    int maximalNetworkRank(int n, vector<vector<int>>& roads) {
        vector<vector<int>> a(n, vector<int>(n, 0));
        for (auto& road : roads) {
            a[road[0]][road[1]] = 1;
            a[road[1]][road[0]] = 1;
        }
        
        vector<int> d(n, 0);
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                d[i] += a[i][j];
            }
        }
        
        vector<vector<int>> rank(n, vector<int>(n, -1));
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (i != j) {
                    rank[i][j] = d[i] + d[j] - a[i][j];
                }
            }
        }
        
        int max = -1;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (rank[i][j] > max) max = rank[i][j];
            }
        }
        return max;
    }
};

class Solution {
public:
    int findTheCity(int n, vector<vector<int>>& edges, int distanceThreshold) {
        const int INF = INT_MAX / 2;
        vector<vector<int>> matrix(n, vector<int>(n, INF));
        
        for (int i = 0; i < n; i++) {
            matrix[i][i] = 0;
        }
        
        for (auto& edge : edges) {
            int u = edge[0], v = edge[1], w = edge[2];
            matrix[u][v] = matrix[v][u] = w;
        }
        
        for (int via = 0; via < n; via++) {
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++) {
                    if (matrix[i][via] + matrix[via][j] < matrix[i][j]) {
                        matrix[i][j] = matrix[i][via] + matrix[via][j];
                    }
                }
            }
        }
        
        int minReachable = n;
        int ans = -1;
        
        for (int i = 0; i < n; i++) {
            int count = 0;
            for (int j = 0; j < n; j++) {
                if (matrix[i][j] <= distanceThreshold) {
                    count++;
                }
            }
            if (count <= minReachable) {
                minReachable = count;
                ans = i;
            }
        }
        
        return ans;
    }
};

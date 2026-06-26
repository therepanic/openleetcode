class Solution {
public:
    int findCircleNum(vector<vector<int>>& isConnected) {
        int n = isConnected.size();
        vector<bool> visited(n, false);
        int count = 0;

        function<void(int)> dfs = [&](int city) {
            for (int neighbor = 0; neighbor < n; neighbor++) {
                if (isConnected[city][neighbor] == 1 && !visited[neighbor]) {
                    visited[neighbor] = true;
                    dfs(neighbor);
                }
            }
        };

        for (int city = 0; city < n; city++) {
            if (!visited[city]) {
                visited[city] = true;
                dfs(city);
                count++;
            }
        }

        return count;
    }
};

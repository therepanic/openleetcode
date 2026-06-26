public class Solution {
    public int FindCircleNum(int[][] isConnected) {
        int n = isConnected.Length;
        bool[] visited = new bool[n];
        int count = 0;

        void Dfs(int city) {
            for (int neighbor = 0; neighbor < n; neighbor++) {
                if (isConnected[city][neighbor] == 1 && !visited[neighbor]) {
                    visited[neighbor] = true;
                    Dfs(neighbor);
                }
            }
        }

        for (int city = 0; city < n; city++) {
            if (!visited[city]) {
                visited[city] = true;
                Dfs(city);
                count++;
            }
        }

        return count;
    }
}

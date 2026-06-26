class Solution {
    public int findCircleNum(int[][] isConnected) {
        int n = isConnected.length;
        boolean[] visited = new boolean[n];
        int count = 0;

        for (int city = 0; city < n; city++) {
            if (!visited[city]) {
                visited[city] = true;
                dfs(isConnected, visited, city);
                count++;
            }
        }

        return count;
    }

    private void dfs(int[][] isConnected, boolean[] visited, int city) {
        int n = isConnected.length;
        for (int neighbor = 0; neighbor < n; neighbor++) {
            if (isConnected[city][neighbor] == 1 && !visited[neighbor]) {
                visited[neighbor] = true;
                dfs(isConnected, visited, neighbor);
            }
        }
    }
}

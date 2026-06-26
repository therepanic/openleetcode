class Solution {
  int findCircleNum(List<List<int>> isConnected) {
    int n = isConnected.length;
    List<bool> visited = List.filled(n, false);
    int count = 0;

    void dfs(int city) {
      for (int neighbor = 0; neighbor < n; neighbor++) {
        if (isConnected[city][neighbor] == 1 && !visited[neighbor]) {
          visited[neighbor] = true;
          dfs(neighbor);
        }
      }
    }

    for (int city = 0; city < n; city++) {
      if (!visited[city]) {
        visited[city] = true;
        dfs(city);
        count++;
      }
    }

    return count;
  }
}

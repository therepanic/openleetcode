class Solution {
  List<List<int>> pacificAtlantic(List<List<int>> heights) {
    if (heights.isEmpty) return [];
    int m = heights.length, n = heights[0].length;
    var directions = [[1, 0], [-1, 0], [0, 1], [0, -1]];
    
    var pacific = List.generate(m, (_) => List.filled(n, false));
    var atlantic = List.generate(m, (_) => List.filled(n, false));
    
    void dfs(int i, int j, List<List<bool>> visited) {
        visited[i][j] = true;
        for (var d in directions) {
            int x = i + d[0], y = j + d[1];
            if (x >= 0 && x < m && y >= 0 && y < n 
                && !visited[x][y] && heights[x][y] >= heights[i][j]) {
                dfs(x, y, visited);
            }
        }
    }
    
    for (int j = 0; j < n; j++) dfs(0, j, pacific);
    for (int i = 0; i < m; i++) dfs(i, 0, pacific);
    for (int j = 0; j < n; j++) dfs(m-1, j, atlantic);
    for (int i = 0; i < m; i++) dfs(i, n-1, atlantic);
    
    List<List<int>> result = [];
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            if (pacific[i][j] && atlantic[i][j]) {
                result.add([i, j]);
            }
        }
    }
    return result;
  }
}

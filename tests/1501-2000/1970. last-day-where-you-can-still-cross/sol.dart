class Solution {
  int latestDayToCross(int row, int col, List<List<int>> cells) {
    int left = 1, right = cells.length, answer = 0;
    while (left <= right) {
      int mid = (left + right) ~/ 2;
      if (canCross(mid, row, col, cells)) {
        answer = mid;
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }
    return answer;
  }
  
  bool canCross(int day, int row, int col, List<List<int>> cells) {
    List<List<int>> grid = List.generate(row, (_) => List.filled(col, 0));
    for (int i = 0; i < day; i++) {
      int r = cells[i][0] - 1;
      int c = cells[i][1] - 1;
      grid[r][c] = 1;
    }
    
    List<int> queueR = [];
    List<int> queueC = [];
    List<List<bool>> visited = List.generate(row, (_) => List.filled(col, false));
    
    for (int c = 0; c < col; c++) {
      if (grid[0][c] == 0) {
        queueR.add(0);
        queueC.add(c);
        visited[0][c] = true;
      }
    }
    
    List<int> dr = [1, -1, 0, 0];
    List<int> dc = [0, 0, 1, -1];
    int head = 0;
    while (head < queueR.length) {
      int r = queueR[head];
      int c = queueC[head];
      head++;
      if (r == row - 1) return true;
      for (int k = 0; k < 4; k++) {
        int nr = r + dr[k];
        int nc = c + dc[k];
        if (nr >= 0 && nr < row && nc >= 0 && nc < col && !visited[nr][nc] && grid[nr][nc] == 0) {
          visited[nr][nc] = true;
          queueR.add(nr);
          queueC.add(nc);
        }
      }
    }
    return false;
  }
}

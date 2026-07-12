import 'dart:collection';

class Solution {
  int shortestPathAllKeys(List<String> grid) {
    int m = grid.length;
    int n = grid[0].length;
    int start_i = 0, start_j = 0;
    int total_keys = 0;
    
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == '@') {
          start_i = i;
          start_j = j;
        }
        if (grid[i][j].codeUnitAt(0) >= 'a'.codeUnitAt(0) && 
            grid[i][j].codeUnitAt(0) <= 'f'.codeUnitAt(0)) {
          total_keys++;
        }
      }
    }
    
    int target_mask = (1 << total_keys) - 1;
    Queue<List<int>> queue = Queue();
    queue.add([start_i, start_j, 0]);
    Set<String> seen = Set();
    seen.add('$start_i,$start_j,0');
    int moves = 0;
    List<List<int>> dirs = [[0,1], [0,-1], [1,0], [-1,0]];
    
    while (queue.isNotEmpty) {
      int size = queue.length;
      for (int k = 0; k < size; k++) {
        List<int> curr = queue.removeFirst();
        int r = curr[0], c = curr[1], mask = curr[2];
        
        if (mask == target_mask) {
          return moves;
        }
        
        for (List<int> dir in dirs) {
          int nr = r + dir[0];
          int nc = c + dir[1];
          
          if (nr < 0 || nr >= m || nc < 0 || nc >= n) {
            continue;
          }
          
          String next_val = grid[nr][nc];
          int next_mask = mask;
          
          int code = next_val.codeUnitAt(0);
          if (code >= 'a'.codeUnitAt(0) && code <= 'f'.codeUnitAt(0)) {
            int key_bit = code - 'a'.codeUnitAt(0);
            next_mask |= (1 << key_bit);
          }
          
          if (code >= 'A'.codeUnitAt(0) && code <= 'F'.codeUnitAt(0)) {
            int lock_bit = next_val.toLowerCase().codeUnitAt(0) - 'a'.codeUnitAt(0);
            if ((next_mask & (1 << lock_bit)) == 0) {
              continue;
            }
          }
          
          String state = '$nr,$nc,$next_mask';
          if (!seen.contains(state) && next_val != '#') {
            queue.add([nr, nc, next_mask]);
            seen.add(state);
          }
        }
      }
      moves++;
    }
    
    return -1;
  }
}

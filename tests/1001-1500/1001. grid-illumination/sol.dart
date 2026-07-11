import 'dart:collection';

class Solution {
  List<int> gridIllumination(int n, List<List<int>> lamps, List<List<int>> queries) {
    Map<int, int> rowCount = HashMap<int, int>();
    Map<int, int> colCount = HashMap<int, int>();
    Map<int, int> diag1 = HashMap<int, int>();
    Map<int, int> diag2 = HashMap<int, int>();
    Set<String> lampSet = HashSet<String>();
    List<int> ans = List<int>.filled(queries.length, 0);
    List<List<int>> dirs = [
      [-1,-1], [-1,0], [-1,1],
      [0,-1],  [0,0],  [0,1],
      [1,-1],  [1,0],  [1,1]
    ];
    
    for (var lamp in lamps) {
      int r = lamp[0], c = lamp[1];
      var key = '$r,$c';
      if (!lampSet.contains(key)) {
        lampSet.add(key);
        rowCount[r] = (rowCount[r] ?? 0) + 1;
        colCount[c] = (colCount[c] ?? 0) + 1;
        diag1[r - c] = (diag1[r - c] ?? 0) + 1;
        diag2[r + c] = (diag2[r + c] ?? 0) + 1;
      }
    }
    
    for (int i = 0; i < queries.length; i++) {
      int r = queries[i][0], c = queries[i][1];
      if ((rowCount[r] ?? 0) > 0 || (colCount[c] ?? 0) > 0 || 
          (diag1[r - c] ?? 0) > 0 || (diag2[r + c] ?? 0) > 0) {
        ans[i] = 1;
        for (var d in dirs) {
          int nr = r + d[0], nc = c + d[1];
          var key = '$nr,$nc';
          if (lampSet.contains(key)) {
            lampSet.remove(key);
            rowCount[nr] = rowCount[nr]! - 1;
            colCount[nc] = colCount[nc]! - 1;
            diag1[nr - nc] = diag1[nr - nc]! - 1;
            diag2[nr + nc] = diag2[nr + nc]! - 1;
          }
        }
      } else {
        ans[i] = 0;
      }
    }
    return ans;
  }
}

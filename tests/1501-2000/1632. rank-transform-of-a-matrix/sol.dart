class Solution {
  List<List<int>> matrixRankTransform(List<List<int>> matrix) {
    int m = matrix.length, n = matrix[0].length;
    Map<int, List<List<int>>> mp = {};
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        mp.putIfAbsent(matrix[i][j], () => []).add([i, j]);
      }
    }
    
    List<int> rank = List.filled(m+n, 0);
    List<List<int>> ans = List.generate(m, (_) => List.filled(n, 0));
    
    List<int> keys = mp.keys.toList()..sort();
    for (int k in keys) {
      List<int> parent = List.generate(m+n, (i) => i);
      late int Function(int) find;
      find = (int p) {
        if (p != parent[p]) parent[p] = find(parent[p]);
        return parent[p];
      };
      
      for (var cell in mp[k]!) {
        int i = cell[0], j = cell[1];
        int ii = find(i);
        int jj = find(m+j);
        parent[ii] = jj;
        rank[jj] = rank[ii] > rank[jj] ? rank[ii] : rank[jj];
      }
      
      Set<int> seen = {};
      for (var cell in mp[k]!) {
        int i = cell[0], j = cell[1];
        int ii = find(i);
        if (!seen.contains(ii)) rank[ii]++;
        seen.add(ii);
        int v = rank[ii];
        rank[i] = v;
        rank[m+j] = v;
        ans[i][j] = v;
      }
    }
    return ans;
  }
}

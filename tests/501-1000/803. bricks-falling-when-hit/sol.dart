class Solution {
  List<int> hitBricks(List<List<int>> grid, List<List<int>> hits) {
    int m = grid.length, n = grid[0].length;
    List<int> parent = List.generate(m * n + 1, (i) => i);
    List<int> rank = List.filled(m * n + 1, 1);
    
    int find(int p) {
      if (p != parent[p]) {
        parent[p] = find(parent[p]);
      }
      return parent[p];
    }
    
    bool union(int p, int q) {
      int rootP = find(p);
      int rootQ = find(q);
      if (rootP == rootQ) return false;
      if (rank[rootP] > rank[rootQ]) {
        int tmp = rootP;
        rootP = rootQ;
        rootQ = tmp;
      }
      parent[rootP] = rootQ;
      rank[rootQ] += rank[rootP];
      return true;
    }
    
    Set<int> seen = {};
    for (var hit in hits) {
      int i = hit[0], j = hit[1];
      if (grid[i][j] == 1) {
        seen.add(i * n + j);
        grid[i][j] = 0;
      }
    }
    
    for (int j = 0; j < n; j++) {
      if (grid[0][j] == 1) {
        union(j, m * n);
      }
    }
    
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1) {
          if (i > 0 && grid[i-1][j] == 1) {
            union(i * n + j, (i-1) * n + j);
          }
          if (j > 0 && grid[i][j-1] == 1) {
            union(i * n + j, i * n + j - 1);
          }
        }
      }
    }
    
    List<int> ans = List.filled(hits.length, 0);
    int prevStable = rank[find(m * n)];
    List<List<int>> dirs = [[1,0], [-1,0], [0,1], [0,-1]];
    
    for (int idx = hits.length - 1; idx >= 0; idx--) {
      int i = hits[idx][0], j = hits[idx][1];
      if (seen.contains(i * n + j)) {
        grid[i][j] = 1;
        if (i == 0) {
          union(j, m * n);
        }
        for (var dir in dirs) {
          int ii = i + dir[0], jj = j + dir[1];
          if (ii >= 0 && ii < m && jj >= 0 && jj < n && grid[ii][jj] == 1) {
            union(i * n + j, ii * n + jj);
          }
        }
        int currStable = rank[find(m * n)];
        ans[idx] = (currStable - prevStable - 1).clamp(0, 999999);
        prevStable = currStable;
      } else {
        ans[idx] = 0;
      }
    }
    
    return ans;
  }
}

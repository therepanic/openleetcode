class Solution {
  int minSwapsCouples(List<int> row) {
    int n = row.length ~/ 2;
    List<int> parent = List.generate(n, (i) => i);
    
    int find(int x) {
      if (parent[x] != x) {
        parent[x] = find(parent[x]);
      }
      return parent[x];
    }
    
    void union(int a, int b) {
      int pa = find(a);
      int pb = find(b);
      if (pa != pb) {
        parent[pa] = pb;
      }
    }
    
    for (int i = 0; i < row.length; i += 2) {
      int couple1 = row[i] ~/ 2;
      int couple2 = row[i+1] ~/ 2;
      union(couple1, couple2);
    }
    
    Map<int, int> componentSize = {};
    for (int couple = 0; couple < n; couple++) {
      int root = find(couple);
      componentSize[root] = (componentSize[root] ?? 0) + 1;
    }
    
    int swaps = 0;
    for (int size in componentSize.values) {
      swaps += size - 1;
    }
    
    return swaps;
  }
}

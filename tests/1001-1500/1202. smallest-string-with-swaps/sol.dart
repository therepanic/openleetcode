class Solution {
  String smallestStringWithSwaps(String s, List<List<int>> pairs) {
    int n = s.length;
    List<int> parent = List.generate(n, (i) => i);
    
    int find(int x) {
      if (parent[x] != x) {
        parent[x] = find(parent[x]);
      }
      return parent[x];
    }
    
    void union(int x, int y) {
      int rx = find(x);
      int ry = find(y);
      if (rx != ry) {
        parent[rx] = ry;
      }
    }
    
    for (var pair in pairs) {
      union(pair[0], pair[1]);
    }
    
    Map<int, List<int>> groups = {};
    for (int i = 0; i < n; i++) {
      int root = find(i);
      groups.putIfAbsent(root, () => []).add(i);
    }
    
    List<String> res = List.filled(n, '');
    for (var indices in groups.values) {
      List<String> chars = indices.map((i) => s[i]).toList();
      indices.sort();
      chars.sort();
      for (int k = 0; k < indices.length; k++) {
        res[indices[k]] = chars[k];
      }
    }
    
    return res.join('');
  }
}

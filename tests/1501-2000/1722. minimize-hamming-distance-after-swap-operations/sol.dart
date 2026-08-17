class Solution {
  int minimumHammingDistance(List<int> source, List<int> target, List<List<int>> allowedSwaps) {
    int n = source.length;
    List<int> parent = List.generate(n, (i) => i);
    
    int find(int x) {
      if (parent[x] != x) {
        parent[x] = find(parent[x]);
      }
      return parent[x];
    }
    
    void unite(int a, int b) {
      parent[find(a)] = find(b);
    }
    
    for (var swap in allowedSwaps) {
      unite(swap[0], swap[1]);
    }
    
    Map<int, List<int>> groups = {};
    for (int i = 0; i < n; i++) {
      int root = find(i);
      groups.putIfAbsent(root, () => []).add(source[i]);
    }
    Map<int, Map<int, int>> freqMap = {};
    groups.forEach((root, vals) {
      Map<int, int> freq = {};
      for (var v in vals) {
        freq[v] = (freq[v] ?? 0) + 1;
      }
      freqMap[root] = freq;
    });
    
    int hammingDist = 0;
    for (int i = 0; i < n; i++) {
      int root = find(i);
      var freq = freqMap[root]!;
      int val = target[i];
      if (freq[val] != null && freq[val]! > 0) {
        freq[val] = freq[val]! - 1;
      } else {
        hammingDist++;
      }
    }
    return hammingDist;
  }
}

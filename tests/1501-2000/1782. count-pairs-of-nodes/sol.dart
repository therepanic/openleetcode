import 'dart:collection';

class Solution {
  List<int> countPairs(int n, List<List<int>> edges, List<int> queries) {
    Map<int, Set<int>> x = HashMap();
    List<int> edge = List.filled(n, 0);
    Map<String, int> edgePair = HashMap();

    for (var e in edges) {
      int i = e[0] - 1;
      int j = e[1] - 1;
      x.putIfAbsent(i, () => HashSet()).add(j);
      x.putIfAbsent(j, () => HashSet()).add(i);
      edge[i]++;
      edge[j]++;
      edgePair['$i,$j'] = (edgePair['$i,$j'] ?? 0) + 1;
      edgePair['$j,$i'] = (edgePair['$j,$i'] ?? 0) + 1;
    }
    
    var res = List<int>.from(edge)..sort();
    
    int binse(int threshold) {
      int i = 0;
      int j = n - 1;
      int ans = n;
      while (i <= j) {
        int mid = (i + j) ~/ 2;
        if (res[mid] > threshold) {
          ans = mid;
          j = mid - 1;
        } else {
          i = mid + 1;
        }
      }
      return n - ans;
    }
    
    List<int> result = [];
    for (int query in queries) {
      Set<int> v = HashSet();
      int ans = 0;
      
      void f(int i) {
        v.add(i);
        int a = binse(query - edge[i]);
        
        if (edge[i] > query - edge[i]) {
          a--;
        }
        
        for (int j in x[i] ?? []) {
          if (edge[j] > query - edge[i] && edge[j] - (edgePair['$i,$j'] ?? 0) <= query - edge[i]) {
            a--;
          }
          if (!v.contains(j)) {
            f(j);
          }
        }
        ans += a;
      }
      
      for (int j = 0; j < n; j++) {
        if (!v.contains(j)) {
          f(j);
        }
      }
      result.add(ans ~/ 2);
    }
    
    return result;
  }
}

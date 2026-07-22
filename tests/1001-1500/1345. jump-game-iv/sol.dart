class Solution {
  int minJumps(List<int> arr) {
    int n = arr.length;
    if (n == 1) return 0;
    
    Map<int, List<int>> mp = {};
    for (int i = 0; i < n; i++) {
      mp.putIfAbsent(arr[i], () => []).add(i);
    }
    
    List<List<int>> q = [[0, 0]];
    List<bool> vis = List.filled(n, false);
    vis[0] = true;
    
    int head = 0;
    while (head < q.length) {
      var curr = q[head++];
      int node = curr[0], dist = curr[1];
      if (node == n - 1) return dist;
      
      if (node - 1 >= 0 && !vis[node - 1]) {
        vis[node - 1] = true;
        q.add([node - 1, dist + 1]);
      }
      if (node + 1 < n && !vis[node + 1]) {
        vis[node + 1] = true;
        q.add([node + 1, dist + 1]);
      }
      
      for (int nxt in mp[arr[node]] ?? []) {
        if (!vis[nxt]) {
          vis[nxt] = true;
          q.add([nxt, dist + 1]);
        }
      }
      mp[arr[node]]?.clear();
    }
    return -1;
  }
}

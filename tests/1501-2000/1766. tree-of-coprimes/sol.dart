class Solution {
  List<int> getCoprimes(List<int> nums, List<List<int>> edges) {
    int n = nums.length;
    List<List<int>> adj = List.generate(n, (_) => []);
    for (var e in edges) {
      adj[e[0]].add(e[1]);
      adj[e[1]].add(e[0]);
    }
    List<int> ans = List.filled(n, -1);
    List<int> depth = List.filled(n, 0);
    List<int> ancestorByValue = List.filled(51, -1);
    
    void dfs(int node, int prev, int dep) {
      depth[node] = dep;
      int best = 1 << 30;
      int bestAnc = -1;
      for (int i = 1; i <= 50; i++) {
        if (gcd(i, nums[node]) == 1) {
          int anc = ancestorByValue[i];
          if (anc != -1) {
            int diff = dep - depth[anc];
            if (diff < best) {
              best = diff;
              bestAnc = anc;
            }
          }
        }
      }
      ans[node] = bestAnc;
      int prevState = ancestorByValue[nums[node]];
      ancestorByValue[nums[node]] = node;
      for (var v in adj[node]) {
        if (v != prev) dfs(v, node, dep + 1);
      }
      ancestorByValue[nums[node]] = prevState;
    }
    
    dfs(0, 0, 0);
    return ans;
  }
  
  int gcd(int a, int b) {
    while (b != 0) {
      int t = a % b;
      a = b;
      b = t;
    }
    return a;
  }
}

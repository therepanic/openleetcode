class Solution {
  bool pyramidTransition(String bottom, List<String> allowed) {
    Map<String, Set<String>> tab = {};
    for (var a in allowed) {
      String key = a[0] + a[1];
      tab.putIfAbsent(key, () => <String>{});
      tab[key]!.add(a[2]);
    }
    
    Set<String> visited = {};
    
    List<String> addNeighbor(String node) {
      List<String> res = [''];
      for (int i = 1; i < node.length; i++) {
        String key = node[i-1] + node[i];
        if (!tab.containsKey(key) || tab[key]!.isEmpty) return [];
        Set<String> chars = tab[key]!;
        List<String> newRes = [];
        for (var r in res) {
          for (var c in chars) {
            newRes.add(r + c);
          }
        }
        res = newRes;
      }
      return res;
    }
    
    bool dfs(String node) {
      if (node.length == 1) return true;
      if (visited.contains(node)) return false;
      
      for (var nxt in addNeighbor(node)) {
        if (dfs(nxt)) return true;
      }
      
      visited.add(node);
      return false;
    }
    
    return dfs(bottom);
  }
}

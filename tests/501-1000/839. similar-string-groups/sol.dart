class Solution {
  bool _checkSimilarity(String str1, String str2) {
    int diff = 0;
    for (int i = 0; i < str1.length; i++) {
      if (str1[i] != str2[i]) {
        diff++;
      }
    }
    return diff == 0 || diff == 2;
  }
  
  void _dfs(int node, List<List<int>> matrix, Set<int> visited) {
    if (visited.contains(node)) {
      return;
    }
    visited.add(node);
    for (int nei in matrix[node]) {
      if (!visited.contains(nei)) {
        _dfs(nei, matrix, visited);
      }
    }
  }
  
  int numSimilarGroups(List<String> strs) {
    int n = strs.length;
    List<List<int>> matrix = List.generate(n, (_) => []);
    
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (_checkSimilarity(strs[i], strs[j])) {
          matrix[i].add(j);
          matrix[j].add(i);
        }
      }
    }
    
    int count = 0;
    Set<int> visited = {};
    for (int start = 0; start < n; start++) {
      if (!visited.contains(start)) {
        _dfs(start, matrix, visited);
        count++;
      }
    }
    
    return count;
  }
}

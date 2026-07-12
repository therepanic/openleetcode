class Solution {
  List<int> loudAndRich(List<List<int>> richer, List<int> quiet) {
    int n = quiet.length;
    List<List<int>> graph = List.generate(n, (_) => []);
    for (var pair in richer) {
      graph[pair[1]].add(pair[0]);
    }
    
    List<int> answer = List.filled(n, -1);
    
    int dfs(int i) {
      if (answer[i] != -1) return answer[i];
      answer[i] = i;
      for (int nei in graph[i]) {
        int item = dfs(nei);
        if (quiet[item] < quiet[answer[i]]) {
          answer[i] = item;
        }
      }
      return answer[i];
    }
    
    for (int i = 0; i < n; i++) {
      dfs(i);
    }
    return answer;
  }
}

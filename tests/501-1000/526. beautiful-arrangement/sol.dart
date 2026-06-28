class Solution {
  int countArrangement(int n) {
    List<bool> visited = List.filled(n + 1, false);
    int backtrack(int index) {
      if (index > n) {
        return 1;
      }
      int count = 0;
      for (int i = 1; i <= n; i++) {
        if (!visited[i] && (i % index == 0 || index % i == 0)) {
          visited[i] = true;
          count += backtrack(index + 1);
          visited[i] = false;
        }
      }
      return count;
    }
    return backtrack(1);
  }
}

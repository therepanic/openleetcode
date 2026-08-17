class Solution {
  int findLatestStep(List<int> arr, int m) {
    int n = arr.length;
    if (m == n) return m;
    
    List<int> groups = List.filled(n + 2, 0);
    int latestStep = -1;
    
    for (int i = 0; i < n; i++) {
      int idx = arr[i];
      int left = groups[idx - 1];
      int right = groups[idx + 1];
      
      if (left == m || right == m) latestStep = i;
      
      groups[idx - left] = groups[idx + right] = left + right + 1;
    }
    
    return latestStep;
  }
}

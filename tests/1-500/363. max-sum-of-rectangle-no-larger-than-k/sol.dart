class Solution {
  int maxSumSubmatrix(List<List<int>> matrix, int k) {
    int m = matrix.length;
    int n = matrix[0].length;
    int ans = -1 << 63;
    for (int left = 0; left < n; left++) {
      List<int> rowSum = List.filled(m, 0);
      for (int right = left; right < n; right++) {
        for (int i = 0; i < m; i++) {
          rowSum[i] += matrix[i][right];
        }
        List<int> s = [0];
        int curr = 0;
        for (int x in rowSum) {
          curr += x;
          int target = curr - k;
          int idx = _bisectLeft(s, target);
          if (idx < s.length) {
            if (curr - s[idx] > ans) {
              ans = curr - s[idx];
            }
          }
          int idxInsert = _bisectLeft(s, curr);
          s.insert(idxInsert, curr);
        }
      }
    }
    return ans;
  }

  int _bisectLeft(List<int> a, int x) {
    int lo = 0, hi = a.length;
    while (lo < hi) {
      int mid = lo + (hi - lo) ~/ 2;
      if (a[mid] < x) {
        lo = mid + 1;
      } else {
        hi = mid;
      }
    }
    return lo;
  }
}

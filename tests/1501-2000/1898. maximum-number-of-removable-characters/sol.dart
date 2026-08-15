class Solution {
  int maximumRemovals(String s, String p, List<int> removable) {
    int left = 0, right = removable.length;
    int maxK = 0;
    while (left <= right) {
      int mid = (left + right) ~/ 2;
      List<bool> removed = List.filled(s.length, false);
      for (int i = 0; i < mid; i++) {
        removed[removable[i]] = true;
      }
      int j = 0;
      for (int i = 0; i < s.length && j < p.length; i++) {
        if (!removed[i] && s[i] == p[j]) {
          j++;
        }
      }
      if (j == p.length) {
        maxK = mid;
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }
    return maxK;
  }
}

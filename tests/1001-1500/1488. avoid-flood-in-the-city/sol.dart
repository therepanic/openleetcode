class Solution {
  List<int> avoidFlood(List<int> rains) {
    int n = rains.length;
    List<int> res = List.filled(n, -1);
    Map<int, int> full = {};
    List<int> dry = [];
    for (int i = 0; i < n; i++) {
      int lake = rains[i];
      if (lake == 0) {
        dry.add(i);
        res[i] = 1;
      } else if (full.containsKey(lake)) {
        int prev = full[lake]!;
        // binary search for first index > prev
        int left = 0, right = dry.length;
        while (left < right) {
          int mid = left + (right - left) ~/ 2;
          if (dry[mid] <= prev) {
            left = mid + 1;
          } else {
            right = mid;
          }
        }
        if (left == dry.length) {
          return [];
        }
        int j = dry[left];
        res[j] = lake;
        dry.removeAt(left);
        full[lake] = i;
      } else {
        full[lake] = i;
      }
    }
    return res;
  }
}

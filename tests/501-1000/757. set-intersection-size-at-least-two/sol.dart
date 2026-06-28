class Solution {
  int intersectionSizeTwo(List<List<int>> intervals) {
    intervals.sort((a, b) {
      if (a[1] != b[1]) return a[1].compareTo(b[1]);
      return b[0].compareTo(a[0]);
    });
    int ans = 0;
    int a = -1, b = -1;
    for (var interval in intervals) {
      int l = interval[0], r = interval[1];
      if (l > b) {
        a = r - 1;
        b = r;
        ans += 2;
      } else if (l > a) {
        a = b;
        b = r;
        ans += 1;
      }
    }
    return ans;
  }
}

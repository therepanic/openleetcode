class Solution {
  int numSplits(String s) {
    int n = s.length;
    int counter = 0;
    Map<String, int> distinct_left = {};
    Map<String, int> distinct_right = {};

    for (int i = 0; i < n; i++) {
      String c = s[i];
      distinct_right[c] = (distinct_right[c] ?? 0) + 1;
    }
    for (int i = 0; i < n - 1; i++) {
      String c = s[i];
      distinct_left[c] = (distinct_left[c] ?? 0) + 1;
      distinct_right[c] = (distinct_right[c] ?? 0) - 1;
      if (distinct_right[c] == 0) {
        distinct_right.remove(c);
      }
      if (distinct_left.length == distinct_right.length) {
        counter++;
      }
    }

    return counter;
  }
}

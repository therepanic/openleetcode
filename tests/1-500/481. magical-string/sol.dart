class Solution {
  int magicalString(int n) {
    if (n <= 0) return 0;
    if (n <= 3) return 1;
    List<int> s = [1, 2, 2];
    int i = 2;
    while (s.length < n) {
      int nextVal = 3 - s.last;
      int count = s[i];
      for (int j = 0; j < count && s.length < n; j++) {
        s.add(nextVal);
      }
      i++;
    }
    return s.take(n).where((x) => x == 1).length;
  }
}

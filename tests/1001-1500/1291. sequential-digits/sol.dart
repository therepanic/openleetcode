class Solution {
  List<int> sequentialDigits(int low, int high) {
    List<int> q = [];
    for (int i = 1; i <= 9; i++) {
      q.add(i);
    }
    for (int i = 0; i < q.length; i++) {
      int x = q[i];
      int d = x % 10;
      if (d < 9) {
        q.add(x * 10 + d + 1);
      }
    }
    return q.where((x) => low <= x && x <= high).toList();
  }
}

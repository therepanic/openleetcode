class Solution {
  bool isCovered(List<List<int>> ranges, int left, int right) {
    List<int> slots = List.filled(51, 0);
    for (var r in ranges) {
      int s = r[0], e = r[1];
      for (int i = s; i <= e; i++) {
        slots[i] = 1;
      }
    }
    for (int i = left; i <= right; i++) {
      if (slots[i] == 0) return false;
    }
    return true;
  }
}

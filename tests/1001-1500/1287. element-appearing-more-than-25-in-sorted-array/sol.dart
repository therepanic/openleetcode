class Solution {
  int findSpecialInteger(List<int> arr) {
    int n = arr.length;
    int q = n ~/ 4;
    Map<int, int> m = {};
    for (int num in arr) {
      m[num] = (m[num] ?? 0) + 1;
      if (m[num]! > q) {
        return num;
      }
    }
    return -1;
  }
}

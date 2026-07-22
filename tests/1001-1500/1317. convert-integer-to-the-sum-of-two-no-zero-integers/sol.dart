class Solution {
  List<int> getNoZeroIntegers(int n) {
    for (int i = 1; i < n; i++) {
      if (!i.toString().contains('0') && !(n - i).toString().contains('0')) {
        return [i, n - i];
      }
    }
    return [];
  }
}

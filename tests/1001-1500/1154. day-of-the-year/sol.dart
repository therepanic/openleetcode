class Solution {
  int dayOfYear(String date) {
    Map<int, int> val = {
      1: 0, 2: 31, 3: 59, 4: 90, 5: 120, 6: 151,
      7: 181, 8: 212, 9: 243, 10: 273, 11: 304, 12: 334
    };
    int d = int.parse(date.substring(8));
    int m = int.parse(date.substring(5, 7));
    int y = int.parse(date.substring(0, 4));
    bool isLeap = (y % 400 == 0) || (y % 4 == 0 && y % 100 != 0);
    if (isLeap) {
      for (int i = 3; i <= 12; i++) {
        val[i] = val[i]! + 1;
      }
    }
    return d + val[m]!;
  }
}

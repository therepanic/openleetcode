class Solution {
  int daysBetweenDates(String date1, String date2) {
    var parts1 = date1.split('-').map(int.parse).toList();
    var parts2 = date2.split('-').map(int.parse).toList();
    int y1 = parts1[0], m1 = parts1[1], d1 = parts1[2];
    int y2 = parts2[0], m2 = parts2[1], d2 = parts2[2];
    return (daysSince1970(y1, m1, d1) - daysSince1970(y2, m2, d2)).abs();
  }

  int daysSince1970(int y, int m, int d) {
    if (m < 3) {
      y--;
      m += 12;
    }
    return 365 * y + y ~/ 4 - y ~/ 100 + y ~/ 400 + (153 * m - 457) ~/ 5 + d - 306 - 719468;
  }
}

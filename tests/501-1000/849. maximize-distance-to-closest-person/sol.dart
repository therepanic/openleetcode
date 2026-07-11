class Solution {
  int maxDistToClosest(List<int> seats) {
    String s = seats.join();
    List<String> parts = s.split('1');
    int maxVal = parts.map((p) => p.length).reduce((a, b) => a > b ? a : b);
    return [parts.first.length, (maxVal + 1) ~/ 2, parts.last.length].reduce((a, b) => a > b ? a : b);
  }
}

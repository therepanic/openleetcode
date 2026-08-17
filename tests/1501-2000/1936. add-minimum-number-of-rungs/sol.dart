class Solution {
  int addRungs(List<int> rungs, int dist) {
    int curr = 0;
    int res = 0;
    for (int rung in rungs) {
      if (rung - curr > dist) {
        res += (rung - curr - 1) ~/ dist;
      }
      curr = rung;
    }
    return res;
  }
}

class Solution {
  int findMinMoves(List<int> machines) {
    int n = machines.length;
    int total = machines.reduce((a, b) => a + b);
    if (total % n != 0) {
      return -1;
    }
    int avg = total ~/ n;
    List<int> imbalances = machines.map((m) => m - avg).toList();
    int res = 0;
    int d = 0;
    for (int imb in imbalances) {
      res = res > d.abs() ? res : d.abs();
      res = res > imb ? res : imb;
      d += imb;
    }
    return res;
  }
}

import 'dart:collection';

class Solution {
  int eatenApples(List<int> apples, List<int> days) {
    final pq = PriorityQueue<List<int>>((a, b) => a[0].compareTo(b[0]));
    int n = apples.length;
    int res = 0;
    int day = 0;
    while (pq.isNotEmpty || day < n) {
      if (day < n && apples[day] > 0) {
        pq.add([day + days[day], apples[day]]);
      }
      while (pq.isNotEmpty && pq.first[0] <= day) {
        pq.removeFirst();
      }
      if (pq.isNotEmpty) {
        final cur = pq.removeFirst();
        res++;
        if (cur[1] - 1 > 0) {
          pq.add([cur[0], cur[1] - 1]);
        }
      }
      day++;
    }
    return res;
  }
}

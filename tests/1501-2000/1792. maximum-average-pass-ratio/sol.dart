import 'dart:collection';

class Solution {
  double maxAverageRatio(List<List<int>> classes, int extraStudents) {
    double gain(int p, int t) => (p + 1) / (t + 1) - p / t;
    final pq = PriorityQueue<List<double>>((a, b) => b[0].compareTo(a[0]));
    for (var c in classes) {
      pq.add([gain(c[0], c[1]), c[0].toDouble(), c[1].toDouble()]);
    }
    for (int i = 0; i < extraStudents; i++) {
      var top = pq.removeFirst();
      double p = top[1], t = top[2];
      p++; t++;
      pq.add([gain(p.toInt(), t.toInt()), p, t]);
    }
    double sum = 0;
    while (pq.isNotEmpty) {
      var item = pq.removeFirst();
      sum += item[1] / item[2];
    }
    return sum / classes.length;
  }
}

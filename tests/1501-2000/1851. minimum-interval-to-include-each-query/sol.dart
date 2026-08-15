import 'dart:collection';

class Solution {
  List<int> minInterval(List<List<int>> intervals, List<int> queries) {
    intervals.sort((a, b) => a[0].compareTo(b[0]));
    final minHeap = PriorityQueue<List<int>>((a, b) => a[0].compareTo(b[0]));
    final res = <int, int>{};
    int i = 0;
    final sortedQueries = List<int>.from(queries)..sort();
    for (final q in sortedQueries) {
      while (i < intervals.length && intervals[i][0] <= q) {
        final l = intervals[i][0];
        final r = intervals[i][1];
        minHeap.add([r - l + 1, r]);
        i++;
      }
      while (minHeap.isNotEmpty && minHeap.first[1] < q) {
        minHeap.removeFirst();
      }
      res[q] = minHeap.isEmpty ? -1 : minHeap.first[0];
    }
    return queries.map((q) => res[q]!).toList();
  }
}

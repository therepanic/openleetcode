import 'package:collection/collection.dart';

class Solution {
  int maxEvents(List<List<int>> events) {
    events.sort((a, b) => a[0].compareTo(b[0]));
    final minHeap = HeapPriorityQueue<int>();
    int day = 0, i = 0, n = events.length, result = 0;
    
    while (minHeap.isNotEmpty || i < n) {
      if (minHeap.isEmpty) {
        day = events[i][0];
      }
      while (i < n && events[i][0] <= day) {
        minHeap.add(events[i][1]);
        i++;
      }
      minHeap.removeFirst();
      result++;
      day++;
      while (minHeap.isNotEmpty && minHeap.first < day) {
        minHeap.removeFirst();
      }
    }
    return result;
  }
}

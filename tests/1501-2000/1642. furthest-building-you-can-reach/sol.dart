import 'dart:collection';

class Solution {
  int furthestBuilding(List<int> heights, int bricks, int ladders) {
    final heap = PriorityQueue<int>((a, b) => a - b);
    final n = heights.length;
    for (int i = 1; i < n; i++) {
      final climb = heights[i] - heights[i-1];
      if (climb <= 0) continue;
      heap.add(climb);
      if (heap.length > ladders) {
        final diff = heap.removeFirst();
        if (bricks >= diff) {
          bricks -= diff;
        } else {
          return i-1;
        }
      }
    }
    return n-1;
  }
}

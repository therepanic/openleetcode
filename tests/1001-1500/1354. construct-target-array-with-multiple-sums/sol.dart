import 'dart:collection';

class Solution {
  bool isPossible(List<int> target) {
    var heap = HeapPriorityQueue<int>((a, b) => b.compareTo(a));
    int total = 0;
    for (var v in target) {
      heap.add(v);
      total += v;
    }
    while (true) {
      int largest = heap.removeFirst();
      int rest = total - largest;
      if (largest == 1 || rest == 1) {
        return true;
      }
      if (rest == 0 || rest >= largest) {
        return false;
      }
      int previous = largest % rest;
      if (previous == 0) {
        return false;
      }
      total = rest + previous;
      heap.add(previous);
    }
  }
}

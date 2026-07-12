import 'dart:collection';

class Solution {
  bool carPooling(List<List<int>> trips, int capacity) {
    trips.sort((a, b) => a[1].compareTo(b[1]));
    var heap = PriorityQueue<List<int>>((a, b) => a[0].compareTo(b[0]));
    int currentPassengers = 0;
    for (var trip in trips) {
      int num = trip[0], src = trip[1], dest = trip[2];
      while (heap.isNotEmpty && heap.first[0] <= src) {
        currentPassengers -= heap.removeFirst()[1];
      }
      if (currentPassengers + num > capacity) {
        return false;
      }
      currentPassengers += num;
      heap.add([dest, num]);
    }
    return true;
  }
}

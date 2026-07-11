class Solution {
  int minRefuelStops(int target, int startFuel, List<List<int>> stations) {
    var fuel = startFuel;
    var count = 0;
    var heap = <int>[];
    stations.add([target, 0]);
    int i = 0;
    while (i < stations.length) {
      if (fuel >= target) return count;
      while (i < stations.length && stations[i][0] <= fuel) {
        heap.add(stations[i][1]);
        heap.sort((a, b) => b - a);
        i++;
      }
      if (heap.isEmpty) return -1;
      fuel += heap.first;
      heap.removeAt(0);
      count++;
    }
    return -1;
  }
}

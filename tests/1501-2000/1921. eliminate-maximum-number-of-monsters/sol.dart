class Solution {
  int eliminateMaximum(List<int> dist, List<int> speed) {
    List<int> arrival = [];
    for (int i = 0; i < dist.length; i++) {
      arrival.add((dist[i] + speed[i] - 1) ~/ speed[i]);
    }
    arrival.sort();
    for (int minute = 0; minute < arrival.length; minute++) {
      if (arrival[minute] <= minute) {
        return minute;
      }
    }
    return arrival.length;
  }
}

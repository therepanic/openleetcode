class Solution {
  double averageWaitingTime(List<List<int>> customers) {
    int waiting = 0;
    int current = 0;
    for (final customer in customers) {
      int arrival = customer[0];
      int time = customer[1];
      if (current <= arrival) {
        current = arrival + time;
        waiting += time;
      } else {
        current += time;
        waiting += (current - arrival);
      }
    }
    return waiting / customers.length;
  }
}

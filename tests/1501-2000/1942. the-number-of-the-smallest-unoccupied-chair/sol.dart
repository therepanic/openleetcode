class Solution {
  int smallestChair(List<List<int>> times, int targetFriend) {
    List<int> target_time = times[targetFriend];
    times.sort((a, b) => a[0].compareTo(b[0]));

    int n = times.length;
    List<int> chair_time = List.filled(n, 0);

    for (List<int> time in times) {
      for (int i = 0; i < n; i++) {
        if (chair_time[i] <= time[0]) {
          chair_time[i] = time[1];
          if (time[0] == target_time[0] && time[1] == target_time[1]) {
            return i;
          }
          break;
        }
      }
    }

    return 0;
  }
}

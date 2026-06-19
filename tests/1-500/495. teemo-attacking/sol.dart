class Solution {
  int findPoisonedDuration(List<int> timeSeries, int duration) {
    int totalSecs = 0;
    int? prev;

    for (int t in timeSeries) {
      totalSecs += duration;

      if (prev != null && prev + duration > t) {
        totalSecs -= (prev + duration - t);
      }

      prev = t;
    }

    return totalSecs;
  }
}

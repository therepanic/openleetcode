class Solution {
  int busyStudent(List<int> startTime, List<int> endTime, int queryTime) {
    int count = 0;
    for (int i = 0; i < startTime.length; i++) {
      if (startTime[i] <= queryTime && queryTime <= endTime[i]) {
        count++;
      }
    }
    return count;
  }
}

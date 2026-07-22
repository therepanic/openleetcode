import 'dart:math';

class Solution {
  int minDifficulty(List<int> jobDifficulty, int d) {
    int length = jobDifficulty.length;
    if (d > length) {
      return -1;
    }

    List<List<int>> minDifficulties = List.generate(d, (_) => List.filled(length, 1 << 60));

    int maxDiff = 0;
    int i = 0;
    while (i <= length - d) {
      maxDiff = max(maxDiff, jobDifficulty[i]);
      minDifficulties[0][i] = maxDiff;
      i++;
    }

    int currentDay = 1;
    while (currentDay < d) {
      int to = currentDay;
      while (to <= length - d + currentDay) {
        int currentJobDifficulty = jobDifficulty[to];
        int result = 1 << 60;
        int j = to - 1;
        while (j >= currentDay - 1) {
          result = min(result, minDifficulties[currentDay - 1][j] + currentJobDifficulty);
          currentJobDifficulty = max(currentJobDifficulty, jobDifficulty[j]);
          j--;
        }
        minDifficulties[currentDay][to] = result;
        to++;
      }
      currentDay++;
    }

    return minDifficulties[d - 1][length - 1];
  }
}

class Solution {
  int numberOfWeeks(List<int> milestones) {
    int total = 0;
    int maxVal = 0;
    for (int m in milestones) {
      total += m;
      if (m > maxVal) maxVal = m;
    }
    if (maxVal <= total - maxVal) {
      return total;
    } else {
      return 2 * (total - maxVal) + 1;
    }
  }
}

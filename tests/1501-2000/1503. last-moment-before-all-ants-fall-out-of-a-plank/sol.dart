class Solution {
  int getLastMoment(int n, List<int> left, List<int> right) {
    int maxVal = 0;
    for (int value in left) {
      if (value > maxVal) {
        maxVal = value;
      }
    }
    for (int value in right) {
      if (n - value > maxVal) {
        maxVal = n - value;
      }
    }
    return maxVal;
  }
}

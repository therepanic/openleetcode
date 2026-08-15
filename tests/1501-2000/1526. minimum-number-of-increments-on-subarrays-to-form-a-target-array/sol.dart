class Solution {
  int minNumberOperations(List<int> target) {
    int total = target[0];
    for (int i = 1; i < target.length; i++) {
      if (target[i] > target[i - 1]) {
        total += target[i] - target[i - 1];
      }
    }
    return total;
  }
}

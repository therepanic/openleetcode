class Solution {
  int maximumWealth(List<List<int>> accounts) {
    int rich = 0;
    for (var i in accounts) {
      int sum = i.reduce((a, b) => a + b);
      if (sum > rich) rich = sum;
    }
    return rich;
  }
}

class Solution {
  String stoneGameIII(List<int> stoneValue) {
    int n = stoneValue.length;
    List<int> dp = [0, 0, 0];

    for (int i = n - 1; i >= 0; i--) {
      int takeOne = stoneValue[i] - dp[(i + 1) % 3];

      int takeTwo = -1e9.toInt();
      if (i + 1 < n) {
        takeTwo = stoneValue[i] + stoneValue[i + 1] - dp[(i + 2) % 3];
      }

      int takeThree = -1e9.toInt();
      if (i + 2 < n) {
        takeThree = stoneValue[i] + stoneValue[i + 1] + stoneValue[i + 2] - dp[(i + 3) % 3];
      }

      dp[i % 3] = [takeOne, takeTwo, takeThree].reduce((a, b) => a > b ? a : b);
    }

    int value = dp[0];
    if (value > 0) {
      return "Alice";
    } else if (value < 0) {
      return "Bob";
    } else {
      return "Tie";
    }
  }
}

class Solution {
  int minDistance(String word1, String word2) {
    final dp = List<int>.generate(word2.length + 1, (i) => i);

    for (var i = 1; i <= word1.length; i++) {
      var prev = dp[0];
      dp[0] = i;
      for (var j = 1; j <= word2.length; j++) {
        final temp = dp[j];
        if (word1.codeUnitAt(i - 1) == word2.codeUnitAt(j - 1)) {
          dp[j] = prev;
        } else {
          var best = prev;
          if (dp[j] < best) {
            best = dp[j];
          }
          if (dp[j - 1] < best) {
            best = dp[j - 1];
          }
          dp[j] = 1 + best;
        }
        prev = temp;
      }
    }

    return dp[word2.length];
  }
}

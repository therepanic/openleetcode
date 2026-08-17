class Solution {
  int bestTeamScore(List<int> scores, List<int> ages) {
    int n = scores.length;
    List<List<int>> players = List.generate(n, (i) => [ages[i], scores[i]]);
    players.sort((a,b) => a[0] != b[0] ? a[0].compareTo(b[0]) : a[1].compareTo(b[1]));
    List<int> dp = List.generate(n, (i) => players[i][1]);
    for (int i=0; i<n; i++) {
      for (int j=0; j<i; j++) {
        if (players[j][1] <= players[i][1]) {
          dp[i] = dp[i] > dp[j]+players[i][1] ? dp[i] : dp[j]+players[i][1];
        }
      }
    }
    return dp.reduce((a,b) => a>b ? a : b);
  }
}

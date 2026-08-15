public class Solution {
    public int BestTeamScore(int[] scores, int[] ages) {
        int n = scores.Length;
        var players = new (int age, int score)[n];
        for (int i=0; i<n; i++) players[i] = (ages[i], scores[i]);
        Array.Sort(players, (a,b) => a.age != b.age ? a.age.CompareTo(b.age) : a.score.CompareTo(b.score));
        int[] dp = new int[n];
        for (int i=0; i<n; i++) dp[i] = players[i].score;
        for (int i=0; i<n; i++) {
            for (int j=0; j<i; j++) {
                if (players[j].score <= players[i].score) {
                    dp[i] = Math.Max(dp[i], dp[j] + players[i].score);
                }
            }
        }
        return dp.Max();
    }
}

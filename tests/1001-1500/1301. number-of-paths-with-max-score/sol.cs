public class Solution {
    public int[] PathsWithMaxScore(IList<string> board) {
        const int MOD = 1_000_000_007;
        int n = board.Count;

        int[] nextScore = new int[n + 1];
        int[] nextWays = new int[n + 1];
        for (int j = 0; j <= n; j++) {
            nextScore[j] = -1;
        }

        for (int i = n - 1; i >= 0; i--) {
            int[] currScore = new int[n + 1];
            int[] currWays = new int[n + 1];
            for (int j = 0; j <= n; j++) {
                currScore[j] = -1;
            }

            string row = board[i];
            for (int j = n - 1; j >= 0; j--) {
                char cell = row[j];

                if (cell == 'X') {
                    continue;
                }

                if (cell == 'S') {
                    currScore[j] = 0;
                    currWays[j] = 1;
                    continue;
                }

                int best = Math.Max(nextScore[j], Math.Max(currScore[j + 1], nextScore[j + 1]));

                if (best == -1) {
                    continue;
                }

                int ways = 0;

                if (nextScore[j] == best) {
                    ways = (ways + nextWays[j]) % MOD;
                }
                if (currScore[j + 1] == best) {
                    ways = (ways + currWays[j + 1]) % MOD;
                }
                if (nextScore[j + 1] == best) {
                    ways = (ways + nextWays[j + 1]) % MOD;
                }

                int value = (cell == 'E') ? 0 : (cell - '0');

                currScore[j] = best + value;
                currWays[j] = ways;
            }

            nextScore = currScore;
            nextWays = currWays;
        }

        if (nextScore[0] == -1) {
            return new int[] { 0, 0 };
        }

        return new int[] { nextScore[0], nextWays[0] };
    }
}

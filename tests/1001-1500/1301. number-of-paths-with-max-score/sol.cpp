class Solution {
public:
    vector<int> pathsWithMaxScore(vector<string>& board) {
        const int MOD = 1'000'000'007;
        int n = board.size();

        vector<int> nextScore(n + 1, -1);
        vector<int> nextWays(n + 1, 0);

        for (int i = n - 1; i >= 0; --i) {
            vector<int> currScore(n + 1, -1);
            vector<int> currWays(n + 1, 0);

            const string& row = board[i];
            for (int j = n - 1; j >= 0; --j) {
                char cell = row[j];

                if (cell == 'X') {
                    continue;
                }

                if (cell == 'S') {
                    currScore[j] = 0;
                    currWays[j] = 1;
                    continue;
                }

                int best = max({nextScore[j], currScore[j + 1], nextScore[j + 1]});

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

            nextScore = std::move(currScore);
            nextWays = std::move(currWays);
        }

        if (nextScore[0] == -1) {
            return {0, 0};
        }

        return {nextScore[0], nextWays[0]};
    }
};

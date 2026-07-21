class Solution {
public:
    int minDifficulty(vector<int>& jobDifficulty, int d) {
        int length = jobDifficulty.size();
        if (d > length) {
            return -1;
        }

        vector<vector<int>> minDifficulties(d, vector<int>(length, INT_MAX));

        int maxDiff = 0;
        int i = 0;
        while (i <= length - d) {
            maxDiff = max(maxDiff, jobDifficulty[i]);
            minDifficulties[0][i] = maxDiff;
            i++;
        }

        int currentDay = 1;
        while (currentDay < d) {
            int to = currentDay;
            while (to <= length - d + currentDay) {
                int currentJobDifficulty = jobDifficulty[to];
                int result = INT_MAX;
                int j = to - 1;
                while (j >= currentDay - 1) {
                    result = min(result, minDifficulties[currentDay - 1][j] + currentJobDifficulty);
                    currentJobDifficulty = max(currentJobDifficulty, jobDifficulty[j]);
                    j--;
                }
                minDifficulties[currentDay][to] = result;
                to++;
            }
            currentDay++;
        }

        return minDifficulties[d - 1][length - 1];
    }
};

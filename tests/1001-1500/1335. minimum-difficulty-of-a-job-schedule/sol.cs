public class Solution {
    public int MinDifficulty(int[] jobDifficulty, int d) {
        int length = jobDifficulty.Length;
        if (d > length) {
            return -1;
        }

        int[][] minDifficulties = new int[d][];
        for (int day = 0; day < d; day++) {
            minDifficulties[day] = new int[length];
            for (int i = 0; i < length; i++) {
                minDifficulties[day][i] = int.MaxValue;
            }
        }

        int maxDiff = 0;
        int idx = 0;
        while (idx <= length - d) {
            maxDiff = Math.Max(maxDiff, jobDifficulty[idx]);
            minDifficulties[0][idx] = maxDiff;
            idx++;
        }

        int currentDay = 1;
        while (currentDay < d) {
            int to = currentDay;
            while (to <= length - d + currentDay) {
                int currentJobDifficulty = jobDifficulty[to];
                int result = int.MaxValue;
                int j = to - 1;
                while (j >= currentDay - 1) {
                    result = Math.Min(result, minDifficulties[currentDay - 1][j] + currentJobDifficulty);
                    currentJobDifficulty = Math.Max(currentJobDifficulty, jobDifficulty[j]);
                    j--;
                }
                minDifficulties[currentDay][to] = result;
                to++;
            }
            currentDay++;
        }

        return minDifficulties[d - 1][length - 1];
    }
}

public class Solution {
    public int MinDeletionSize(string[] strs) {
        int n = strs.Length;
        int m = strs[0].Length;
        bool[] sortedPairs = new bool[n - 1];
        int delCount = 0;

        for (int col = 0; col < m; col++) {
            bool bad = false;
            for (int i = 0; i < n - 1; i++) {
                if (!sortedPairs[i] && strs[i][col] > strs[i + 1][col]) {
                    bad = true;
                    break;
                }
            }

            if (bad) {
                delCount++;
                continue;
            }

            for (int i = 0; i < n - 1; i++) {
                if (!sortedPairs[i] && strs[i][col] < strs[i + 1][col]) {
                    sortedPairs[i] = true;
                }
            }

            if (sortedPairs.All(b => b)) break;
        }

        return delCount;
    }
}

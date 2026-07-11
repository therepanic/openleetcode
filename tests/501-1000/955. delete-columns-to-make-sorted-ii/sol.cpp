class Solution {
public:
    int minDeletionSize(vector<string>& strs) {
        int n = strs.size();
        int m = strs[0].size();
        vector<bool> sortedPairs(n - 1, false);
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

            bool allSorted = true;
            for (bool b : sortedPairs) {
                if (!b) {
                    allSorted = false;
                    break;
                }
            }
            if (allSorted) break;
        }

        return delCount;
    }
};

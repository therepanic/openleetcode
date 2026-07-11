class Solution {
    public int minDeletionSize(String[] strs) {
        int n = strs.length;
        int m = strs[0].length();
        boolean[] sortedPairs = new boolean[n - 1];
        int delCount = 0;

        for (int col = 0; col < m; col++) {
            boolean bad = false;
            for (int i = 0; i < n - 1; i++) {
                if (!sortedPairs[i] && strs[i].charAt(col) > strs[i + 1].charAt(col)) {
                    bad = true;
                    break;
                }
            }

            if (bad) {
                delCount++;
                continue;
            }

            for (int i = 0; i < n - 1; i++) {
                if (!sortedPairs[i] && strs[i].charAt(col) < strs[i + 1].charAt(col)) {
                    sortedPairs[i] = true;
                }
            }

            boolean allSorted = true;
            for (boolean b : sortedPairs) {
                if (!b) {
                    allSorted = false;
                    break;
                }
            }
            if (allSorted) break;
        }

        return delCount;
    }
}

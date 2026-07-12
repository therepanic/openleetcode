class Solution {
    public int maxProfitAssignment(int[] difficulty, int[] profit, int[] worker) {
        int n = difficulty.length;
        int[][] jobs = new int[n][2];
        for (int j = 0; j < n; j++) {
            jobs[j][0] = difficulty[j];
            jobs[j][1] = profit[j];
        }
        java.util.Arrays.sort(jobs, (a, b) -> Integer.compare(a[0], b[0]));
        java.util.Arrays.sort(worker);
        int ans = 0, best = 0, i = 0;
        for (int ability : worker) {
            while (i < n && jobs[i][0] <= ability) {
                best = Math.max(best, jobs[i][1]);
                i++;
            }
            ans += best;
        }
        return ans;
    }
}

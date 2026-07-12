public class Solution {
    public int MaxProfitAssignment(int[] difficulty, int[] profit, int[] worker) {
        int n = difficulty.Length;
        int[][] jobs = new int[n][];
        for (int i = 0; i < n; i++) {
            jobs[i] = new int[] { difficulty[i], profit[i] };
        }
        Array.Sort(jobs, (a, b) => a[0].CompareTo(b[0]));
        Array.Sort(worker);
        int ans = 0, best = 0, idx = 0;
        foreach (int ability in worker) {
            while (idx < n && jobs[idx][0] <= ability) {
                best = Math.Max(best, jobs[idx][1]);
                idx++;
            }
            ans += best;
        }
        return ans;
    }
}

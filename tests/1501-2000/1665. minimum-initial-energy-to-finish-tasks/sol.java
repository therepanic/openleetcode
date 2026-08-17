class Solution {
    public int minimumEffort(int[][] tasks) {
        java.util.Arrays.sort(tasks, (a, b) -> Integer.compare((b[1] - b[0]), (a[1] - a[0])));
        int lo = 0, hi = 1000000001;
        while (lo < hi) {
            int mid = (lo + hi) / 2;
            if (can(mid, tasks)) {
                hi = mid;
            } else {
                lo = mid + 1;
            }
        }
        return lo;
    }
    private boolean can(int bal, int[][] tasks) {
        for (int[] t : tasks) {
            if (bal < t[1]) return false;
            bal -= t[0];
        }
        return true;
    }
}

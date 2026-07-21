class Solution {
    public int removeCoveredIntervals(int[][] intervals) {
        Arrays.sort(intervals, (a, b) -> a[0] == b[0] ? b[1] - a[1] : a[0] - b[0]);
        int res = 0, r = 0;
        for (int[] interval : intervals) {
            if (interval[1] > r) {
                res++;
            }
            r = Math.max(r, interval[1]);
        }
        return res;
    }
}

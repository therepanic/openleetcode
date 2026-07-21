public class Solution {
    public int RemoveCoveredIntervals(int[][] intervals) {
        Array.Sort(intervals, (a, b) => a[0] == b[0] ? b[1].CompareTo(a[1]) : a[0].CompareTo(b[0]));
        int res = 0, r = 0;
        foreach (var interval in intervals) {
            if (interval[1] > r) {
                res++;
            }
            r = Math.Max(r, interval[1]);
        }
        return res;
    }
}

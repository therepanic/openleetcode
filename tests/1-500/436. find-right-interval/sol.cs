public class Solution {
    public int[] FindRightInterval(int[][] intervals) {
        int n = intervals.Length;
        int[][] starts = new int[n][];
        for (int i = 0; i < n; i++) {
            starts[i] = new int[] { intervals[i][0], i };
        }
        Array.Sort(starts, (a, b) => a[0].CompareTo(b[0]));
        int[] res = new int[n];
        for (int i = 0; i < n; i++) {
            int end = intervals[i][1];
            int left = 0, right = n - 1;
            int idx = -1;
            while (left <= right) {
                int mid = (left + right) / 2;
                if (starts[mid][0] >= end) {
                    idx = starts[mid][1];
                    right = mid - 1;
                } else {
                    left = mid + 1;
                }
            }
            res[i] = idx;
        }
        return res;
    }
}

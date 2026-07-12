using System;

public class Solution {
    public int[][] KClosest(int[][] points, int k) {
        Array.Sort(points, (a, b) => {
            long da = 1L * a[0] * a[0] + 1L * a[1] * a[1];
            long db = 1L * b[0] * b[0] + 1L * b[1] * b[1];
            return da.CompareTo(db);
        });
        var ans = new int[k][];
        for (int i = 0; i < k; i++) {
            ans[i] = points[i];
        }
        return ans;
    }
}

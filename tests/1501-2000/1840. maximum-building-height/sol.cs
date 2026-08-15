public class Solution {
    public int MaxBuilding(int n, int[][] restrictions) {
        var r = restrictions.ToList();
        r.Add(new int[]{1, 0});
        r.Sort((a, b) => a[0].CompareTo(b[0]));
        int m = r.Count;
        
        for (int i = 1; i < m; i++) {
            r[i][1] = Math.Min(r[i][1], r[i-1][1] + Math.Abs(r[i][0] - r[i-1][0]));
        }
        
        for (int i = m - 2; i >= 0; i--) {
            r[i][1] = Math.Min(r[i][1], r[i+1][1] + Math.Abs(r[i+1][0] - r[i][0]));
        }
        
        int res = 0;
        for (int i = 1; i < m; i++) {
            res = Math.Max(res, (r[i-1][1] + r[i][1] + r[i][0] - r[i-1][0]) / 2);
        }
        
        return Math.Max(res, r[m-1][1] + n - r[m-1][0]);
    }
}

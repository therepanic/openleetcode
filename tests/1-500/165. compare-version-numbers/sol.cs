public class Solution {
    public int CompareVersion(string version1, string version2) {
        var a = version1.Split('.');
        var b = version2.Split('.');
        int n = System.Math.Max(a.Length, b.Length);
        for (int i = 0; i < n; i++) {
            int x = i < a.Length ? int.Parse(a[i]) : 0;
            int y = i < b.Length ? int.Parse(b[i]) : 0;
            if (x < y) return -1;
            if (x > y) return 1;
        }
        return 0;
    }
}

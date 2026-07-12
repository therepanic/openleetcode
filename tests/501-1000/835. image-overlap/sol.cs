public class Solution {
    public int LargestOverlap(int[][] img1, int[][] img2) {
        int n = img1.Length;
        var a = new List<(int, int)>();
        var b = new List<(int, int)>();
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (img1[i][j] == 1) a.Add((i, j));
                if (img2[i][j] == 1) b.Add((i, j));
            }
        }
        var cnt = new Dictionary<(int, int), int>();
        foreach (var (x1, y1) in a) {
            foreach (var (x2, y2) in b) {
                var key = (x1 - x2, y1 - y2);
                if (cnt.ContainsKey(key)) cnt[key]++;
                else cnt[key] = 1;
            }
        }
        int max = 0;
        foreach (var val in cnt.Values) {
            if (val > max) max = val;
        }
        return max;
    }
}

public class Solution {
    public int TallestBillboard(int[] rods) {
        int n = rods.Length;
        int mid = (n - 1) >> 1;
        
        var left = new List<(int, int)>();
        var right = new List<(int, int)>();
        
        void Gen(int idx, int end, int a, int b, List<(int, int)> vals) {
            if (idx == end + 1) {
                vals.Add((a - b, b));
                return;
            }
            Gen(idx + 1, end, a, b, vals);
            Gen(idx + 1, end, a + rods[idx], b, vals);
            Gen(idx + 1, end, a, b + rods[idx], vals);
        }
        
        Gen(0, mid, 0, 0, left);
        Gen(mid + 1, n - 1, 0, 0, right);
        
        left.Sort((a, b) => a.Item1 != b.Item1 ? a.Item1.CompareTo(b.Item1) : b.Item2.CompareTo(a.Item2));
        right.Sort((a, b) => a.Item1 != b.Item1 ? a.Item1.CompareTo(b.Item1) : b.Item2.CompareTo(a.Item2));
        
        int ans = 0;
        var rightDiffs = new int[right.Count];
        var rightHeights = new int[right.Count];
        for (int i = 0; i < right.Count; i++) {
            rightDiffs[i] = right[i].Item1;
            rightHeights[i] = right[i].Item2;
        }
        
        for (int i = 0; i < left.Count; i++) {
            int d = left[i].Item1, b = left[i].Item2;
            int target = -d;
            int lo = 0, hi = rightDiffs.Length;
            while (lo < hi) {
                int m = (lo + hi) >> 1;
                if (rightDiffs[m] < target) lo = m + 1;
                else hi = m;
            }
            if (lo < rightDiffs.Length && rightDiffs[lo] == target) {
                ans = Math.Max(ans, b + rightHeights[lo]);
            }
        }
        return ans;
    }
}

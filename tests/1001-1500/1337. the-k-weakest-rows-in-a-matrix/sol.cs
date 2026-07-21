public class Solution {
    public int[] KWeakestRows(int[][] mat, int k) {
        int n = mat.Length;
        var dict = new Dictionary<int, int>();
        for (int i = 0; i < n; i++) {
            int sum = 0;
            foreach (int val in mat[i]) {
                sum += val;
            }
            dict[i] = sum;
        }
        return dict.OrderBy(x => x.Value).ThenBy(x => x.Key).Take(k).Select(x => x.Key).ToArray();
    }
}

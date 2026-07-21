public class Solution {
    public int KthSmallest(int[][] mat, int k) {
        int[] sums = mat[0].Take(k).ToArray();
        for (int i = 1; i < mat.Length; i++) {
            int[] row = mat[i].Take(k).ToArray();
            int[] next = new int[sums.Length * row.Length];
            int idx = 0;
            foreach (int a in sums) {
                foreach (int b in row) {
                    next[idx++] = a + b;
                }
            }
            Array.Sort(next);
            sums = next.Take(k).ToArray();
        }
        return sums[k - 1];
    }
}

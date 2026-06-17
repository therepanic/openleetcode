public class Solution {
    public int NthUglyNumber(int n) {
        int[] h = new int[n];
        h[0] = 1;
        int i = 0, j = 0, k = 0;

        for (int idx = 1; idx < n; idx++) {
            int m = Math.Min(h[i] * 2, Math.Min(h[j] * 3, h[k] * 5));
            h[idx] = m;

            if (m == h[i] * 2) i++;
            if (m == h[j] * 3) j++;
            if (m == h[k] * 5) k++;
        }

        return h[n - 1];
    }
}

class Solution {
    public int getMaximumGenerated(int n) {
        if (n == 0) {
            return 0;
        } else if (n == 1 || n == 2) {
            return 1;
        } else {
            int[] a = new int[n + 1];
            a[0] = 0;
            a[1] = 1;
            int v = 1;
            for (int i = 2; i <= n; i++) {
                if (i % 2 == 0) {
                    a[i] = a[v];
                } else {
                    a[i] = a[v] + a[v + 1];
                    v++;
                }
            }
            int max = 0;
            for (int num : a) {
                if (num > max) max = num;
            }
            return max;
        }
    }
}

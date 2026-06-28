public class Solution {
    public int[] ConstructArray(int n, int k) {
        int[] ans = new int[n];
        int idx = 0;
        for (int i = 1; i <= n - k; i++) {
            ans[idx++] = i;
        }
        for (int i = 0; i < k; i++) {
            int diff = i / 2 + 1;
            if (i % 2 == 0) {
                ans[idx++] = n - diff + 1;
            } else {
                ans[idx++] = n - k + diff;
            }
        }
        return ans;
    }
}

class Solution {
    public int sumSubarrayMins(int[] arr) {
        int MOD = 1_000_000_007;
        int n = arr.length;
        int[] stack = new int[n];
        int top = -1;
        long[] res = new long[n];
        for (int i = 0; i < n; i++) {
            while (top >= 0 && arr[stack[top]] > arr[i]) {
                top--;
            }
            int j = top >= 0 ? stack[top] : -1;
            res[i] = (j >= 0 ? res[j] : 0) + (long)(i - j) * arr[i];
            stack[++top] = i;
        }
        long sum = 0;
        for (long v : res) {
            sum = (sum + v) % MOD;
        }
        return (int) sum;
    }
}

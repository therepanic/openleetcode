public class Solution {
    public int SumSubarrayMins(int[] arr) {
        const int MOD = 1_000_000_007;
        int n = arr.Length;
        var stack = new Stack<int>();
        long[] res = new long[n];
        for (int i = 0; i < n; i++) {
            while (stack.Count > 0 && arr[stack.Peek()] > arr[i]) {
                stack.Pop();
            }
            int j = stack.Count > 0 ? stack.Peek() : -1;
            res[i] = (j >= 0 ? res[j] : 0) + (long)(i - j) * arr[i];
            stack.Push(i);
        }
        long sum = 0;
        foreach (long v in res) {
            sum = (sum + v) % MOD;
        }
        return (int) sum;
    }
}

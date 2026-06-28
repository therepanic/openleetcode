public class Solution {
    public int[] DailyTemperatures(int[] temperatures) {
        int n = temperatures.Length;
        int[] ans = new int[n];
        int[] stack = new int[n];
        int top = -1;

        for (int i = 0; i < n; i++) {
            while (top >= 0 && temperatures[i] > temperatures[stack[top]]) {
                int prev = stack[top--];
                ans[prev] = i - prev;
            }
            stack[++top] = i;
        }

        return ans;
    }
}

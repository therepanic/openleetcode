public class Solution {
    public int MaxTurbulenceSize(int[] arr) {
        int N = arr.Length;
        if (N < 2) return N;

        int ans = 1;
        int anchor = 0;

        int Compare(int x, int y) {
            if (x < y) return -1;
            if (x > y) return 1;
            return 0;
        }

        for (int i = 1; i < N; i++) {
            int c = Compare(arr[i - 1], arr[i]);
            if (c == 0) {
                anchor = i;
            } else {
                if (i == N - 1 || c * Compare(arr[i], arr[i + 1]) != -1) {
                    ans = Math.Max(ans, i - anchor + 1);
                    anchor = i;
                }
            }
        }
        return ans;
    }
}

class Solution {
    public int maxTurbulenceSize(int[] arr) {
        int N = arr.length;
        if (N < 2) return N;

        int ans = 1;
        int anchor = 0;

        for (int i = 1; i < N; i++) {
            int c = compare(arr[i - 1], arr[i]);
            if (c == 0) {
                anchor = i;
            } else {
                if (i == N - 1 || c * compare(arr[i], arr[i + 1]) != -1) {
                    ans = Math.max(ans, i - anchor + 1);
                    anchor = i;
                }
            }
        }
        return ans;
    }

    private int compare(int x, int y) {
        if (x < y) return -1;
        if (x > y) return 1;
        return 0;
    }
}

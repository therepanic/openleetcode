class Solution {
    public int intersectionSizeTwo(int[][] intervals) {
        java.util.Arrays.sort(intervals, (x, y) -> {
            if (x[1] != y[1]) return x[1] - y[1];
            return y[0] - x[0];
        });
        int ans = 0;
        int a = -1, b = -1;
        for (int[] interval : intervals) {
            int l = interval[0], r = interval[1];
            if (l > b) {
                a = r - 1;
                b = r;
                ans += 2;
            } else if (l > a) {
                a = b;
                b = r;
                ans += 1;
            }
        }
        return ans;
    }
}

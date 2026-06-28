public class Solution {
    public int IntersectionSizeTwo(int[][] intervals) {
        System.Array.Sort(intervals, (x, y) => {
            if (x[1] != y[1]) return x[1].CompareTo(y[1]);
            return y[0].CompareTo(x[0]);
        });
        int ans = 0;
        int a = -1, b = -1;
        foreach (var interval in intervals) {
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

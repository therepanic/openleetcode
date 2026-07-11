public class Solution {
    public int TwoCitySchedCost(int[][] costs) {
        int res = 0;
        Array.Sort(costs, (a, b) => (a[0] - a[1]).CompareTo(b[0] - b[1]));
        int n = costs.Length;
        for (int i = 0; i < n; i++) {
            if (i < n / 2) {
                res += costs[i][0];
            } else {
                res += costs[i][1];
            }
        }
        return res;
    }
}

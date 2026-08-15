public class Solution {
    public int MaximumWealth(int[][] accounts) {
        int rich = 0;
        foreach (var i in accounts) {
            int sum = 0;
            foreach (int j in i) {
                sum += j;
            }
            rich = Math.Max(rich, sum);
        }
        return rich;
    }
}

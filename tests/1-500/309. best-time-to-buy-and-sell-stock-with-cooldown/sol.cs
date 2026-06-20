public class Solution {
    public int MaxProfit(int[] prices) {
        int a = int.MinValue;
        int b = 0;
        int c = 0;
        foreach (int p in prices) {
            int newA = Math.Max(a, c - p);
            int newB = a + p;
            int newC = Math.Max(c, b);
            a = newA;
            b = newB;
            c = newC;
        }
        return Math.Max(b, c);
    }
}

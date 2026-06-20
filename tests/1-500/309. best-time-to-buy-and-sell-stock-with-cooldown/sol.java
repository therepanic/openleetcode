class Solution {
    public int maxProfit(int[] prices) {
        int a = Integer.MIN_VALUE;
        int b = 0;
        int c = 0;
        for (int p : prices) {
            int newA = Math.max(a, c - p);
            int newB = a + p;
            int newC = Math.max(c, b);
            a = newA;
            b = newB;
            c = newC;
        }
        return Math.max(b, c);
    }
}

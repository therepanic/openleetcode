class Solution {
    public int maxIceCream(int[] costs, int coins) {
        int xMin = costs[0], xMax = costs[0];
        for (int x : costs) {
            xMin = Math.min(xMin, x);
            xMax = Math.max(xMax, x);
        }
        int[] freq = new int[xMax + 1];
        for (int x : costs) {
            freq[x]++;
            xMin = Math.min(xMin, x);
        }
        int cnt = 0;
        for (int x = xMin; x <= xMax; x++) {
            int f = freq[x];
            if (f == 0) continue;
            int buy = Math.min(coins / x, f);
            if (buy == 0) break;
            cnt += buy;
            coins -= buy * x;
        }
        return cnt;
    }
}

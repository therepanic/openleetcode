public class Solution {
    public int MaxIceCream(int[] costs, int coins) {
        int xMin = costs.Min();
        int xMax = costs.Max();
        int[] freq = new int[xMax + 1];
        foreach (int x in costs) {
            freq[x]++;
            xMin = Math.Min(xMin, x);
        }
        int cnt = 0;
        for (int x = xMin; x <= xMax; x++) {
            int f = freq[x];
            if (f == 0) continue;
            int buy = Math.Min(coins / x, f);
            if (buy == 0) break;
            cnt += buy;
            coins -= buy * x;
        }
        return cnt;
    }
}

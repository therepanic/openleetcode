public class Solution {
    public int MaxProfit(int[] inventory, int orders) {
        int maxVal = 0;
        foreach (int v in inventory) maxVal = Math.Max(maxVal, v);
        long t = BinarySearch(inventory, 0, maxVal, orders);
        long total = 0, sold = 0;
        foreach (int ball in inventory) {
            if (ball > t) {
                long cnt = ball - t;
                total += (ball + t + 1) * cnt / 2;
                sold += cnt;
            }
        }
        long extra = sold - orders;
        long res = total - extra * (t + 1);
        const long MOD = 1000000007;
        return (int)((res % MOD + MOD) % MOD);
    }

    private long BinarySearch(int[] arr, int left, int right, int target) {
        while (left < right) {
            int mid = (left + right + 1) / 2;
            long count = 0;
            foreach (int x in arr) {
                if (x > mid) count += x - mid;
            }
            if (count >= target) left = mid;
            else right = mid - 1;
        }
        return left;
    }
}

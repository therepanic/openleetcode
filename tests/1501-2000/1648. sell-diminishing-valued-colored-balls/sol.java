class Solution {
    public int maxProfit(int[] inventory, int orders) {
        int max = 0;
        for (int ball : inventory) max = Math.max(max, ball);
        long t = binarySearch(inventory, 0, max, orders);
        long total = 0;
        long sold = 0;
        for (int ball : inventory) {
            if (ball > t) {
                long cnt = ball - t;
                total += (ball + t + 1) * cnt / 2;
                sold += cnt;
            }
        }
        long extra = sold - orders;
        long res = total - extra * (t + 1);
        return (int)(res % 1000000007);
    }

    private long binarySearch(int[] arr, int left, int right, int target) {
        while (left < right) {
            int mid = (left + right + 1) / 2;
            long count = 0;
            for (int x : arr) {
                if (x > mid) count += x - mid;
            }
            if (count >= target) left = mid;
            else right = mid - 1;
        }
        return left;
    }
}

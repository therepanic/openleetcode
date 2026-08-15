class Solution {
    public int minimumSize(int[] nums, int maxOperations) {
        int lo = 1, hi = 0;
        for (int x : nums) hi = Math.max(hi, x);
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            long needed = 0;
            for (int x : nums) needed += (x - 1) / mid;
            if (needed <= maxOperations) hi = mid;
            else lo = mid + 1;
        }
        return lo;
    }
}

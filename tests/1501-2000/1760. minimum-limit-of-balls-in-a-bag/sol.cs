public class Solution {
    public int MinimumSize(int[] nums, int maxOperations) {
        int lo = 1, hi = nums.Max();
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            long needed = 0;
            foreach (int x in nums) {
                needed += (x - 1) / mid;
            }
            if (needed <= maxOperations) {
                hi = mid;
            } else {
                lo = mid + 1;
            }
        }
        return lo;
    }
}

public class Solution {
    public int SmallestDivisor(int[] nums, int threshold) {
        int low = 1;
        int high = nums.Max();
        int ans = high;

        while (low <= high) {
            int mid = low + (high - low) / 2;

            int total = 0;
            foreach (int num in nums) {
                total += (num + mid - 1) / mid;
            }

            if (total <= threshold) {
                ans = mid;
                high = mid - 1;
            } else {
                low = mid + 1;
            }
        }

        return ans;
    }
}

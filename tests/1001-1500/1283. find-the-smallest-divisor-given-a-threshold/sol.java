class Solution {
    public int smallestDivisor(int[] nums, int threshold) {
        int low = 1;
        int high = 0;
        for (int num : nums) {
            if (num > high) high = num;
        }
        int ans = high;

        while (low <= high) {
            int mid = low + (high - low) / 2;

            int total = 0;
            for (int num : nums) {
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

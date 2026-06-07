public class Solution {
    private int Bound(int[] nums, int target, bool left) {
        int low = 0;
        int high = nums.Length - 1;
        int ans = -1;

        while (low <= high) {
            int mid = low + (high - low) / 2;
            if (nums[mid] < target) {
                low = mid + 1;
            } else if (nums[mid] > target) {
                high = mid - 1;
            } else {
                ans = mid;
                if (left) {
                    high = mid - 1;
                } else {
                    low = mid + 1;
                }
            }
        }

        return ans;
    }

    public int[] SearchRange(int[] nums, int target) {
        return new[] { Bound(nums, target, true), Bound(nums, target, false) };
    }
}

public class Solution {
    public bool KLengthApart(int[] nums, int k) {
        if (k == 0) {
            return true;
        }
        int? prev = null;
        for (int i = 0; i < nums.Length; i++) {
            if (nums[i] == 1) {
                if (prev != null && i - prev.Value <= k) {
                    return false;
                }
                prev = i;
            }
        }
        return true;
    }
}

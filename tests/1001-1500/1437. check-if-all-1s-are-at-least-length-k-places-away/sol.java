class Solution {
    public boolean kLengthApart(int[] nums, int k) {
        if (k == 0) {
            return true;
        }
        Integer prev = null;
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == 1) {
                if (prev != null && i - prev <= k) {
                    return false;
                }
                prev = i;
            }
        }
        return true;
    }
}

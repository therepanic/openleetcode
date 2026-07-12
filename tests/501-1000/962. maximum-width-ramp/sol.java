class Solution {
    public int maxWidthRamp(int[] nums) {
        int n = nums.length;
        int[] right_max = new int[n];
        right_max[n - 1] = nums[n - 1];
        
        for (int i = n - 2; i >= 0; i--) {
            right_max[i] = Math.max(nums[i], right_max[i + 1]);
        }
        
        int i = 0, j = 0, result = 0;
        while (j < n) {
            if (nums[i] <= right_max[j]) {
                result = Math.max(result, j - i);
                j++;
            } else {
                i++;
            }
        }
        
        return result;
    }
}

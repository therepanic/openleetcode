class Solution {
    public int[] sortArrayByParityII(int[] nums) {
        int i = 0, j = 1;
        int n = nums.length;
        
        while (i < n && j < n) {
            if (nums[i] % 2 == 0) {
                i += 2;
            } else if (nums[j] % 2 == 1) {
                j += 2;
            } else {
                int temp = nums[i];
                nums[i] = nums[j];
                nums[j] = temp;
                i += 2;
                j += 2;
            }
        }
        return nums;
    }
}

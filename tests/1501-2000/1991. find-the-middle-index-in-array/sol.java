class Solution {
    public int findMiddleIndex(int[] nums) {
        int total = 0;
        for (int num : nums) total += num;
        
        int leftSum = 0;
        int rightSum = total;
        
        for (int i = 0; i < nums.length; i++) {
            rightSum -= nums[i];
            if (leftSum == rightSum) return i;
            leftSum += nums[i];
        }
        
        return -1;
    }
}

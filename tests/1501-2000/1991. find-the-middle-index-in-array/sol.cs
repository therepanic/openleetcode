public class Solution {
    public int FindMiddleIndex(int[] nums) {
        int total = nums.Sum();
        int leftSum = 0;
        int rightSum = total;
        
        for (int i = 0; i < nums.Length; i++) {
            rightSum -= nums[i];
            if (leftSum == rightSum) return i;
            leftSum += nums[i];
        }
        
        return -1;
    }
}

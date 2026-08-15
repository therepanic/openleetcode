class Solution {
    public int minOperations(int[] nums) {
        int length = nums.length;
        int minOps = length;
        int[] uniqueNums = java.util.Arrays.stream(nums).distinct().sorted().toArray();
        int right = 0;
        
        for (int left = 0; left < uniqueNums.length; left++) {
            while (right < uniqueNums.length && uniqueNums[right] < uniqueNums[left] + length) {
                right++;
            }
            
            minOps = Math.min(minOps, length - (right - left));
        }
        
        return minOps;
    }
}

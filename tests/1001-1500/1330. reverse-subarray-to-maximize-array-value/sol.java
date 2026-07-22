class Solution {
    public int maxValueAfterReverse(int[] nums) {
        if (nums.length < 2) return 0;
        
        int maxMin = Integer.MIN_VALUE;
        int minMin = Integer.MAX_VALUE;
        int S = 0;
        int boundary = Integer.MIN_VALUE;
        
        for (int i = 0; i < nums.length - 1; i++) {
            int a = nums[i];
            int b = nums[i + 1];
            int distance = Math.abs(a - b);
            boundary = Math.max(boundary, Math.max(Math.abs(nums[nums.length - 1] - a), Math.abs(nums[0] - b)) - distance);
            S += distance;
            minMin = Math.min(Math.max(a, b), minMin);
            maxMin = Math.max(Math.min(a, b), maxMin);
        }
        
        return S + Math.max(2 * (maxMin - minMin), boundary);
    }
}

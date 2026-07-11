class Solution {
    public int largestPerimeter(int[] nums) {
        int minVal = Integer.MAX_VALUE;
        int maxVal = Integer.MIN_VALUE;
        for (int x : nums) {
            if (x < minVal) minVal = x;
            if (x > maxVal) maxVal = x;
        }

        int[] freq = new int[maxVal - minVal + 1];
        for (int x : nums) {
            freq[x - minVal]++;
        }

        int idx = 0;
        for (int v = maxVal; v >= minVal; v--) {
            while (freq[v - minVal] > 0) {
                nums[idx] = v;
                idx++;
                freq[v - minVal]--;
            }
        }

        for (int i = 0; i < nums.length - 2; i++) {
            if (nums[i + 1] + nums[i + 2] > nums[i]) {
                return nums[i] + nums[i + 1] + nums[i + 2];
            }
        }
        return 0;
    }
}

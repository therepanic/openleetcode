public class Solution {
    public int LargestPerimeter(int[] nums) {
        int minVal = nums[0];
        int maxVal = nums[0];
        foreach (int x in nums) {
            if (x < minVal) minVal = x;
            if (x > maxVal) maxVal = x;
        }

        int[] freq = new int[maxVal - minVal + 1];
        foreach (int x in nums) {
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

        for (int i = 0; i < nums.Length - 2; i++) {
            if (nums[i + 1] + nums[i + 2] > nums[i]) {
                return nums[i] + nums[i + 1] + nums[i + 2];
            }
        }
        return 0;
    }
}

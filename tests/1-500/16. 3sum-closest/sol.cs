using System;

public class Solution {
    public int ThreeSumClosest(int[] nums, int target) {
        Array.Sort(nums);
        int best = nums[0] + nums[1] + nums[2];
        for (int i = 0; i + 2 < nums.Length; i++) {
            int l = i + 1, r = nums.Length - 1;
            while (l < r) {
                int sum = nums[i] + nums[l] + nums[r];
                if (Math.Abs(target - sum) < Math.Abs(target - best)) best = sum;
                if (sum == target) return target;
                if (sum < target) l++; else r--;
            }
        }
        return best;
    }
}

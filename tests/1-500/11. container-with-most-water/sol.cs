using System;

public class Solution {
    public int MaxArea(int[] height) {
        int left = 0, right = height.Length - 1, ans = 0;
        while (left < right) {
            ans = Math.Max(ans, Math.Min(height[left], height[right]) * (right - left));
            if (height[left] < height[right]) left++;
            else right--;
        }
        return ans;
    }
}

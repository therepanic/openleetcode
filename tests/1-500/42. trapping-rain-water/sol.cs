public class Solution {
    public int Trap(int[] height) {
        int left = 0;
        int right = height.Length - 1;
        int leftMax = 0;
        int rightMax = 0;
        int total = 0;

        while (left < right) {
            leftMax = System.Math.Max(leftMax, height[left]);
            rightMax = System.Math.Max(rightMax, height[right]);

            if (leftMax < rightMax) {
                total += leftMax - height[left];
                left++;
            } else {
                total += rightMax - height[right];
                right--;
            }
        }

        return total;
    }
}

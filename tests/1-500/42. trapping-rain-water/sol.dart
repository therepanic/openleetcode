class Solution {
  int trap(List<int> height) {
    var left = 0;
    var right = height.length - 1;
    var leftMax = 0;
    var rightMax = 0;
    var total = 0;

    while (left < right) {
      leftMax = leftMax > height[left] ? leftMax : height[left];
      rightMax = rightMax > height[right] ? rightMax : height[right];

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

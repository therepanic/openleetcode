class Solution {
  int maxArea(List<int> height) {
    var left = 0;
    var right = height.length - 1;
    var ans = 0;
    while (left < right) {
      ans = ans > (height[left] < height[right] ? height[left] : height[right]) * (right - left)
          ? ans
          : (height[left] < height[right] ? height[left] : height[right]) * (right - left);
      if (height[left] < height[right]) {
        left++;
      } else {
        right--;
      }
    }
    return ans;
  }
}

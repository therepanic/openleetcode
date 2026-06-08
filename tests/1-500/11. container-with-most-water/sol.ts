function maxArea(height: number[]): number {
  let left = 0;
  let right = height.length - 1;
  let ans = 0;
  while (left < right) {
    ans = Math.max(ans, Math.min(height[left], height[right]) * (right - left));
    if (height[left] < height[right]) left++;
    else right--;
  }
  return ans;
}

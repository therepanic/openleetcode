class Solution {
  int maxValueAfterReverse(List<int> nums) {
    if (nums.length < 2) return 0;
    
    int maxMin = -1 << 63;
    int minMin = 1 << 62;
    int S = 0;
    int boundary = -1 << 63;
    
    for (int i = 0; i < nums.length - 1; i++) {
      int a = nums[i];
      int b = nums[i + 1];
      int distance = (a - b).abs();
      boundary = max(boundary, max((nums.last - a).abs(), (nums[0] - b).abs()) - distance);
      S += distance;
      minMin = min(max(a, b), minMin);
      maxMin = max(min(a, b), maxMin);
    }
    
    return S + max(2 * (maxMin - minMin), boundary);
  }
  
  int max(int a, int b) => a > b ? a : b;
  int min(int a, int b) => a < b ? a : b;
}

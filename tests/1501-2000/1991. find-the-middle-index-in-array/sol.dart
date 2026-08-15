class Solution {
  int findMiddleIndex(List<int> nums) {
    int total = nums.reduce((a, b) => a + b);
    int leftSum = 0;
    int rightSum = total;
    
    for (int i = 0; i < nums.length; i++) {
      rightSum -= nums[i];
      if (leftSum == rightSum) return i;
      leftSum += nums[i];
    }
    
    return -1;
  }
}

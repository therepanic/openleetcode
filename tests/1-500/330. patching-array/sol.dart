class Solution {
  int minPatches(List<int> nums, int n) {
    int currentSum = 1;
    int patches = 0;
    int index = 0;
    
    while (currentSum <= n) {
      if (index < nums.length && nums[index] <= currentSum) {
        currentSum += nums[index];
        index++;
      } else {
        currentSum += currentSum;
        patches++;
      }
    }
    
    return patches;
  }
}

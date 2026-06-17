class Solution {
  bool containsNearbyDuplicate(List<int> nums, int k) {
    Set<int> windowSet = {};
    
    for (int i = 0; i < nums.length; i++) {
      if (i > k) {
        windowSet.remove(nums[i - k - 1]);
      }
      
      if (windowSet.contains(nums[i])) {
        return true;
      }
      
      windowSet.add(nums[i]);
    }
    
    return false;
  }
}

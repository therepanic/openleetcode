class Solution {
  bool canBeIncreasing(List<int> nums) {
    int n = nums.length;
    int idx = -1;
    
    for (int i = 0; i < n - 1; i++) {
      if (nums[i] >= nums[i + 1]) {
        idx = i;
        break;
      }
    }
    
    bool flag = true;
    for (int i = idx + 1; i < n - 1; i++) {
      if (nums[i] >= nums[i + 1]) {
        flag = false;
        break;
      }
    }
    
    if ((idx == 0 || idx == n - 1) && flag) return true;
    if (idx - 1 >= 0 && idx + 1 < n && nums[idx - 1] < nums[idx + 1] && flag) return true;
    
    for (int i = n - 1; i > 0; i--) {
      if (nums[i] <= nums[i - 1]) {
        idx = i;
        break;
      }
    }
    
    flag = true;
    for (int i = idx - 1; i > 0; i--) {
      if (nums[i] <= nums[i - 1]) {
        flag = false;
        break;
      }
    }
    
    if ((idx == 0 || idx == n - 1) && flag) return true;
    if (idx - 1 >= 0 && idx + 1 < n && nums[idx - 1] >= nums[idx + 1]) return false;
    return flag;
  }
}

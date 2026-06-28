class Solution {
  bool isIdealPermutation(List<int> nums) {
    for (int i = 0; i < nums.length; i++) {
      if ((nums[i] - i).abs() > 1) {
        return false;
      }
    }
    return true;
  }
}

class Solution {
  List<int> findDisappearedNumbers(List<int> nums) {
    for (int i = 0; i < nums.length; i++) {
      int idx = nums[i].abs() - 1;
      if (nums[idx] > 0) {
        nums[idx] *= -1;
      }
    }
    List<int> res = [];
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] > 0) {
        res.add(i + 1);
      }
    }
    return res;
  }
}

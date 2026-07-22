class Solution {
  List<int> createTargetArray(List<int> nums, List<int> index) {
    List<int> target = [];
    for (int i = 0; i < nums.length; i++) {
      target.insert(index[i], nums[i]);
    }
    return target;
  }
}

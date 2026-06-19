class Solution {
  List<int> findDuplicates(List<int> nums) {
    List<int> r = [];
    for (int x in nums) {
      int idx = x.abs() - 1;
      if (nums[idx] < 0) {
        r.add(x.abs());
      } else {
        nums[idx] = -nums[idx];
      }
    }
    return r;
  }
}

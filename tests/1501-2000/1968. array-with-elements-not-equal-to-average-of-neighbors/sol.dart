class Solution {
  List<int> rearrangeArray(List<int> nums) {
    nums.sort();
    List<int> res = List<int>.filled(nums.length, 0);
    int mid = (nums.length + 1) ~/ 2;
    int j = 0;
    for (int i = 0; i < nums.length; i += 2) {
      res[i] = nums[j++];
    }
    j = mid;
    for (int i = 1; i < nums.length; i += 2) {
      res[i] = nums[j++];
    }
    return res;
  }
}

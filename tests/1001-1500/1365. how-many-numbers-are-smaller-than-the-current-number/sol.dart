class Solution {
  List<int> smallerNumbersThanCurrent(List<int> nums) {
    List<int> allNums = List.filled(101, 0);
    List<int> res = List.filled(nums.length, 0);

    for (int v in nums) {
      allNums[v]++;
    }

    for (int v = 1; v <= 100; v++) {
      allNums[v] += allNums[v - 1];
    }

    for (int i = 0; i < nums.length; i++) {
      int v = nums[i];
      if (v == 0) {
        res[i] = 0;
      } else {
        res[i] = allNums[v - 1];
      }
    }
    return res;
  }
}

class Solution {
  List<int> minSubsequence(List<int> nums) {
    nums.sort();
    List<int> v = [];
    int l = nums.length;
    int sumV = 0, sumRem = nums.reduce((a, b) => a + b);
    while (sumV <= sumRem) {
      l--;
      sumV += nums[l];
      sumRem -= nums[l];
      v.add(nums[l]);
    }
    return v;
  }
}

class Solution {
  String kthLargestNumber(List<String> nums, int k) {
    nums.sort((a, b) {
      if (a.length != b.length) return b.length.compareTo(a.length);
      return b.compareTo(a);
    });
    return nums[k - 1];
  }
}

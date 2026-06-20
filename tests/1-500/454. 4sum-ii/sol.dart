class Solution {
  int fourSumCount(List<int> nums1, List<int> nums2, List<int> nums3, List<int> nums4) {
    Map<int, int> map = {};
    for (int a in nums1) {
      for (int b in nums2) {
        int sum = a + b;
        map[sum] = (map[sum] ?? 0) + 1;
      }
    }
    int count = 0;
    for (int c in nums3) {
      for (int d in nums4) {
        count += map[-(c + d)] ?? 0;
      }
    }
    return count;
  }
}

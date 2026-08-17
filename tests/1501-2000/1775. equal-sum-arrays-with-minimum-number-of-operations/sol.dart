class Solution {
  int minOperations(List<int> nums1, List<int> nums2) {
    int x = nums1.fold(0, (a,b) => a+b);
    int y = nums2.fold(0, (a,b) => a+b);
    if (x == y) return 0;
    if (x < y) {
      if (6*nums1.length < nums2.length) return -1;
      List<int> gains = [];
      for (int v in nums1) gains.add(6-v);
      for (int v in nums2) gains.add(v-1);
      gains.sort((a,b) => b.compareTo(a));
      int diff = y - x;
      int ops = 0;
      for (int g in gains) {
        if (diff <= 0) break;
        diff -= g;
        ops++;
      }
      return diff <= 0 ? ops : -1;
    } else {
      if (6*nums2.length < nums1.length) return -1;
      List<int> gains = [];
      for (int v in nums1) gains.add(v-1);
      for (int v in nums2) gains.add(6-v);
      gains.sort((a,b) => b.compareTo(a));
      int diff = x - y;
      int ops = 0;
      for (int g in gains) {
        if (diff <= 0) break;
        diff -= g;
        ops++;
      }
      return diff <= 0 ? ops : -1;
    }
  }
}

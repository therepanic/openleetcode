class Solution {
  int maxDistance(List<int> nums1, List<int> nums2) {
    int i = 0, j = 0;
    int ans = 0;
    while (i < nums1.length && j < nums2.length) {
      if (nums1[i] <= nums2[j]) {
        if (j - i > ans) ans = j - i;
        j++;
      } else {
        i++;
        if (i > j) j = i;
      }
    }
    return ans;
  }
}

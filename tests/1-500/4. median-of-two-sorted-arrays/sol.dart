class Solution {
  double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
    if (nums1.length > nums2.length) {
      return findMedianSortedArrays(nums2, nums1);
    }

    int m = nums1.length;
    int n = nums2.length;
    int totalLeft = (m + n + 1) >> 1;
    int left = 0;
    int right = m;

    while (left <= right) {
      int i = (left + right) >> 1;
      int j = totalLeft - i;

      int maxLeft1 = i == 0 ? -2147483648 : nums1[i - 1];
      int minRight1 = i == m ? 2147483647 : nums1[i];
      int maxLeft2 = j == 0 ? -2147483648 : nums2[j - 1];
      int minRight2 = j == n ? 2147483647 : nums2[j];

      if (maxLeft1 <= minRight2 && maxLeft2 <= minRight1) {
        int leftMax = maxLeft1 > maxLeft2 ? maxLeft1 : maxLeft2;
        if (((m + n) & 1) == 1) {
          return leftMax.toDouble();
        }
        int rightMin = minRight1 < minRight2 ? minRight1 : minRight2;
        return (leftMax + rightMin) / 2.0;
      }

      if (maxLeft1 > minRight2) {
        right = i - 1;
      } else {
        left = i + 1;
      }
    }

    return 0.0;
  }
}

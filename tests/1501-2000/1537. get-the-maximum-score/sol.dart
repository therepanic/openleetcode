class Solution {
  int maxSum(List<int> nums1, List<int> nums2) {
    int p1 = 0, p2 = 0;
    int sum1 = 0, sum2 = 0, result = 0;
    while (p1 < nums1.length && p2 < nums2.length) {
      if (nums1[p1] == nums2[p2]) {
        result += (sum1 > sum2 ? sum1 : sum2) + nums1[p1];
        sum1 = 0; sum2 = 0;
        p1++; p2++;
      } else if (nums1[p1] < nums2[p2]) {
        sum1 += nums1[p1];
        p1++;
      } else {
        sum2 += nums2[p2];
        p2++;
      }
    }
    while (p1 < nums1.length) {
      sum1 += nums1[p1];
      p1++;
    }
    while (p2 < nums2.length) {
      sum2 += nums2[p2];
      p2++;
    }
    return (result + (sum1 > sum2 ? sum1 : sum2)) % 1000000007;
  }
}

using System;

public class Solution {
    public double FindMedianSortedArrays(int[] nums1, int[] nums2) {
        if (nums1.Length > nums2.Length) {
            return FindMedianSortedArrays(nums2, nums1);
        }

        int m = nums1.Length;
        int n = nums2.Length;
        int totalLeft = (m + n + 1) / 2;
        int left = 0;
        int right = m;

        while (left <= right) {
            int i = (left + right) / 2;
            int j = totalLeft - i;

            int maxLeft1 = i == 0 ? int.MinValue : nums1[i - 1];
            int minRight1 = i == m ? int.MaxValue : nums1[i];
            int maxLeft2 = j == 0 ? int.MinValue : nums2[j - 1];
            int minRight2 = j == n ? int.MaxValue : nums2[j];

            if (maxLeft1 <= minRight2 && maxLeft2 <= minRight1) {
                int leftMax = Math.Max(maxLeft1, maxLeft2);
                if (((m + n) & 1) == 1) {
                    return leftMax;
                }
                int rightMin = Math.Min(minRight1, minRight2);
                return ((long)leftMax + rightMin) / 2.0;
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

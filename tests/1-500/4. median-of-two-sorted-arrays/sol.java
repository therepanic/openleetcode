public class Solution {
    public double findMedianSortedArrays(int[] nums1, int[] nums2) {
        if (nums1.length > nums2.length) {
            return findMedianSortedArrays(nums2, nums1);
        }

        int m = nums1.length;
        int n = nums2.length;
        int totalLeft = (m + n + 1) / 2;
        int left = 0;
        int right = m;

        while (left <= right) {
            int i = (left + right) / 2;
            int j = totalLeft - i;

            int maxLeft1 = i == 0 ? Integer.MIN_VALUE : nums1[i - 1];
            int minRight1 = i == m ? Integer.MAX_VALUE : nums1[i];
            int maxLeft2 = j == 0 ? Integer.MIN_VALUE : nums2[j - 1];
            int minRight2 = j == n ? Integer.MAX_VALUE : nums2[j];

            if (maxLeft1 <= minRight2 && maxLeft2 <= minRight1) {
                int leftMax = Math.max(maxLeft1, maxLeft2);
                if (((m + n) & 1) == 1) {
                    return leftMax;
                }
                int rightMin = Math.min(minRight1, minRight2);
                return ((long) leftMax + rightMin) / 2.0;
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

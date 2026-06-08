class Solution {
public:
    double findMedianSortedArrays(vector<int>& nums1, vector<int>& nums2) {
        if (nums1.size() > nums2.size()) nums1.swap(nums2);

        int m = (int)nums1.size();
        int n = (int)nums2.size();
        int totalLeft = (m + n + 1) / 2;
        int left = 0, right = m;

        while (left <= right) {
            int i = (left + right) / 2;
            int j = totalLeft - i;

            int maxLeft1 = i == 0 ? -2147483647 - 1 : nums1[i - 1];
            int minRight1 = i == m ? 2147483647 : nums1[i];
            int maxLeft2 = j == 0 ? -2147483647 - 1 : nums2[j - 1];
            int minRight2 = j == n ? 2147483647 : nums2[j];

            if (maxLeft1 <= minRight2 && maxLeft2 <= minRight1) {
                long long leftMax = maxLeft1 > maxLeft2 ? maxLeft1 : maxLeft2;
                if (((m + n) & 1) == 1) return (double)leftMax;
                long long rightMin = minRight1 < minRight2 ? minRight1 : minRight2;
                return (leftMax + rightMin) / 2.0;
            }

            if (maxLeft1 > minRight2) right = i - 1;
            else left = i + 1;
        }

        return 0.0;
    }
};

public class Solution {
    public int MaxDistance(int[] nums1, int[] nums2) {
        int i = 0, j = 0;
        int ans = 0;
        while (i < nums1.Length && j < nums2.Length) {
            if (nums1[i] <= nums2[j]) {
                ans = Math.Max(ans, j - i);
                j++;
            } else {
                i++;
                if (i > j) j = i;
            }
        }
        return ans;
    }
}

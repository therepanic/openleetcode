public class Solution {
    public int MaxSum(int[] nums1, int[] nums2) {
        int p1 = 0, p2 = 0;
        long sum1 = 0, sum2 = 0, result = 0;
        while (p1 < nums1.Length && p2 < nums2.Length) {
            if (nums1[p1] == nums2[p2]) {
                result += Math.Max(sum1, sum2) + nums1[p1];
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
        while (p1 < nums1.Length) {
            sum1 += nums1[p1];
            p1++;
        }
        while (p2 < nums2.Length) {
            sum2 += nums2[p2];
            p2++;
        }
        return (int)((result + Math.Max(sum1, sum2)) % 1000000007);
    }
}

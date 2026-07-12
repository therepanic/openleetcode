public class Solution {
    public int[] AdvantageCount(int[] nums1, int[] nums2) {
        int n = nums1.Length;
        Array.Sort(nums1);
        
        int[][] nums2Sorted = new int[n][];
        for (int i = 0; i < n; i++) {
            nums2Sorted[i] = new int[] { nums2[i], i };
        }
        Array.Sort(nums2Sorted, (a, b) => a[0].CompareTo(b[0]));
        
        int[] res = new int[n];
        int left = 0, right = n - 1;
        for (int i = n - 1; i >= 0; i--) {
            if (nums1[right] > nums2Sorted[i][0]) {
                res[nums2Sorted[i][1]] = nums1[right];
                right--;
            } else {
                res[nums2Sorted[i][1]] = nums1[left];
                left++;
            }
        }
        
        return res;
    }
}

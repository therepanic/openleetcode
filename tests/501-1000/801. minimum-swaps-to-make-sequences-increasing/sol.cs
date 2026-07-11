public class Solution {
    public int MinSwap(int[] nums1, int[] nums2) {
        int n = nums1.Length;
        int keep = 0;
        int swap = 1;
        
        for (int i = 1; i < n; i++) {
            bool inc = nums1[i] > nums1[i - 1] && nums2[i] > nums2[i - 1];
            bool cross = nums1[i] > nums2[i - 1] && nums2[i] > nums1[i - 1];
            
            if (inc && cross) {
                int m = Math.Min(keep, swap);
                keep = m;
                swap = m + 1;
            } else if (inc) {
                swap += 1;
            } else {
                int temp = keep;
                keep = swap;
                swap = temp + 1;
            }
        }
        
        return Math.Min(keep, swap);
    }
}

class Solution {
    public int minSwap(int[] nums1, int[] nums2) {
        int n = nums1.length;
        int keep = 0;
        int swap = 1;
        
        for (int i = 1; i < n; i++) {
            boolean inc = nums1[i] > nums1[i - 1] && nums2[i] > nums2[i - 1];
            boolean cross = nums1[i] > nums2[i - 1] && nums2[i] > nums1[i - 1];
            
            if (inc && cross) {
                int m = Math.min(keep, swap);
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
        
        return Math.min(keep, swap);
    }
}

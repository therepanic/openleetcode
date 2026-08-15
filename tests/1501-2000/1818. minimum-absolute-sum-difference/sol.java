import java.util.Arrays;

class Solution {
    public int minAbsoluteSumDiff(int[] nums1, int[] nums2) {
        final int MOD = 1_000_000_007;
        int n = nums1.length;
        int[] sortedNums1 = nums1.clone();
        Arrays.sort(sortedNums1);
        long total = 0;
        long maxReduction = 0;
        
        for (int i = 0; i < n; i++) {
            int a = nums1[i];
            int b = nums2[i];
            long currDiff = Math.abs(a - b);
            total += currDiff;
            
            int idx = Arrays.binarySearch(sortedNums1, b);
            if (idx < 0) idx = -idx - 1;
            
            if (idx < n) {
                maxReduction = Math.max(maxReduction, currDiff - Math.abs(sortedNums1[idx] - b));
            }
            if (idx > 0) {
                maxReduction = Math.max(maxReduction, currDiff - Math.abs(sortedNums1[idx - 1] - b));
            }
        }
        
        return (int)((total - maxReduction) % MOD);
    }
}

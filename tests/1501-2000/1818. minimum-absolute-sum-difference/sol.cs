using System;

public class Solution {
    public int MinAbsoluteSumDiff(int[] nums1, int[] nums2) {
        const int MOD = 1000000007;
        int n = nums1.Length;
        int[] sortedNums1 = (int[])nums1.Clone();
        Array.Sort(sortedNums1);
        long total = 0;
        long maxReduction = 0;
        
        for (int i = 0; i < n; i++) {
            int a = nums1[i];
            int b = nums2[i];
            long currDiff = Math.Abs(a - b);
            total += currDiff;
            
            int idx = Array.BinarySearch(sortedNums1, b);
            if (idx < 0) idx = ~idx;
            
            if (idx < n) {
                maxReduction = Math.Max(maxReduction, currDiff - Math.Abs(sortedNums1[idx] - b));
            }
            if (idx > 0) {
                maxReduction = Math.Max(maxReduction, currDiff - Math.Abs(sortedNums1[idx - 1] - b));
            }
        }
        
        return (int)((total - maxReduction) % MOD);
    }
}

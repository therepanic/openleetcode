public class Solution {
    public int MinWastedSpace(int[] packages, int[][] boxes) {
        Array.Sort(packages);
        int n = packages.Length;
        long totalPackageSum = 0;
        foreach (int p in packages) totalPackageSum += p;
        
        long minGrossArea = long.MaxValue;
        
        foreach (int[] supplierBoxes in boxes) {
            Array.Sort(supplierBoxes);
            if (supplierBoxes[supplierBoxes.Length - 1] < packages[n - 1]) continue;
            
            long grossArea = 0;
            int lowIdx = 0;
            
            foreach (int b in supplierBoxes) {
                int highIdx = UpperBound(packages, b, lowIdx);
                int count = highIdx - lowIdx;
                if (count > 0) {
                    grossArea += (long)b * count;
                    lowIdx = highIdx;
                }
                if (lowIdx == n) break;
            }
            
            if (grossArea < minGrossArea) minGrossArea = grossArea;
        }
        
        if (minGrossArea == long.MaxValue) return -1;
        return (int)((minGrossArea - totalPackageSum) % 1000000007);
    }
    
    private int UpperBound(int[] arr, int target, int lo) {
        int hi = arr.Length;
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            if (arr[mid] <= target) lo = mid + 1;
            else hi = mid;
        }
        return lo;
    }
}

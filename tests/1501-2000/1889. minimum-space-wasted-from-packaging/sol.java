class Solution {
    public int minWastedSpace(int[] packages, int[][] boxes) {
        Arrays.sort(packages);
        int n = packages.length;
        long totalPackageSum = 0;
        for (int p : packages) totalPackageSum += p;
        
        long minGrossArea = Long.MAX_VALUE;
        
        for (int[] supplierBoxes : boxes) {
            Arrays.sort(supplierBoxes);
            if (supplierBoxes[supplierBoxes.length - 1] < packages[n - 1]) continue;
            
            long grossArea = 0;
            int lowIdx = 0;
            
            for (int b : supplierBoxes) {
                int highIdx = upperBound(packages, b, lowIdx);
                int count = highIdx - lowIdx;
                if (count > 0) {
                    grossArea += (long) b * count;
                    lowIdx = highIdx;
                }
                if (lowIdx == n) break;
            }
            
            minGrossArea = Math.min(minGrossArea, grossArea);
        }
        
        if (minGrossArea == Long.MAX_VALUE) return -1;
        return (int) ((minGrossArea - totalPackageSum) % 1000000007);
    }
    
    private int upperBound(int[] arr, int target, int lo) {
        int hi = arr.length;
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            if (arr[mid] <= target) lo = mid + 1;
            else hi = mid;
        }
        return lo;
    }
}

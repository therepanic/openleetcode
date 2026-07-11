class Solution {
    public int tallestBillboard(int[] rods) {
        int n = rods.length;
        int mid = (n - 1) >> 1;
        
        java.util.List<int[]> left = new java.util.ArrayList<>();
        java.util.List<int[]> right = new java.util.ArrayList<>();
        
        gen(0, mid, 0, 0, rods, left);
        gen(mid + 1, n - 1, 0, 0, rods, right);
        
        left.sort((a, b) -> a[0] != b[0] ? Integer.compare(a[0], b[0]) : Integer.compare(b[1], a[1]));
        right.sort((a, b) -> a[0] != b[0] ? Integer.compare(a[0], b[0]) : Integer.compare(b[1], a[1]));
        
        int ans = 0;
        int[] rightDiffs = new int[right.size()];
        int[] rightHeights = new int[right.size()];
        for (int i = 0; i < right.size(); i++) {
            rightDiffs[i] = right.get(i)[0];
            rightHeights[i] = right.get(i)[1];
        }
        
        for (int i = 0; i < left.size(); i++) {
            int d = left.get(i)[0];
            int b = left.get(i)[1];
            int target = -d;
            int idx = lowerBound(rightDiffs, target);
            if (idx < rightDiffs.length && rightDiffs[idx] == target) {
                ans = Math.max(ans, b + rightHeights[idx]);
            }
        }
        return ans;
    }
    
    private void gen(int idx, int end, int a, int b, int[] rods, java.util.List<int[]> vals) {
        if (idx == end + 1) {
            vals.add(new int[]{a - b, b});
            return;
        }
        gen(idx + 1, end, a, b, rods, vals);
        gen(idx + 1, end, a + rods[idx], b, rods, vals);
        gen(idx + 1, end, a, b + rods[idx], rods, vals);
    }
    
    private int lowerBound(int[] arr, int target) {
        int lo = 0, hi = arr.length;
        while (lo < hi) {
            int mid = (lo + hi) >>> 1;
            if (arr[mid] < target) lo = mid + 1;
            else hi = mid;
        }
        return lo;
    }
}

class Solution {
    public int[] longestObstacleCourseAtEachPosition(int[] obstacles) {
        int n = obstacles.length;
        int[] tails = new int[n];
        int len = 0;
        int[] res = new int[n];
        for (int i = 0; i < n; i++) {
            int x = obstacles[i];
            int idx = upperBound(tails, len, x);
            res[i] = idx + 1;
            if (idx == len) {
                tails[len++] = x;
            } else {
                tails[idx] = x;
            }
        }
        return res;
    }
    
    private int upperBound(int[] arr, int len, int target) {
        int lo = 0, hi = len;
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            if (arr[mid] <= target) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        return lo;
    }
}

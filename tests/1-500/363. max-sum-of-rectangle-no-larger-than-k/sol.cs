public class Solution {
    public int MaxSumSubmatrix(int[][] matrix, int k) {
        int m = matrix.Length;
        int n = matrix[0].Length;
        int ans = int.MinValue;
        for (int left = 0; left < n; left++) {
            int[] rowSum = new int[m];
            for (int right = left; right < n; right++) {
                for (int i = 0; i < m; i++) {
                    rowSum[i] += matrix[i][right];
                }
                var s = new List<int> { 0 };
                int curr = 0;
                foreach (int x in rowSum) {
                    curr += x;
                    int target = curr - k;
                    int lo = 0, hi = s.Count;
                    while (lo < hi) {
                        int mid = lo + (hi - lo) / 2;
                        if (s[mid] < target) {
                            lo = mid + 1;
                        } else {
                            hi = mid;
                        }
                    }
                    if (lo < s.Count) {
                        ans = Math.Max(ans, curr - s[lo]);
                    }
                    lo = 0;
                    hi = s.Count;
                    while (lo < hi) {
                        int mid = lo + (hi - lo) / 2;
                        if (s[mid] < curr) {
                            lo = mid + 1;
                        } else {
                            hi = mid;
                        }
                    }
                    s.Insert(lo, curr);
                }
            }
        }
        return ans;
    }
}

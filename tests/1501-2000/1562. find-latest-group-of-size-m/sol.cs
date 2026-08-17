public class Solution {
    public int FindLatestStep(int[] arr, int m) {
        int n = arr.Length;
        if (m == n) return m;
        
        int[] groups = new int[n + 2];
        int latestStep = -1;
        
        for (int i = 0; i < n; i++) {
            int idx = arr[i];
            int left = groups[idx - 1];
            int right = groups[idx + 1];
            
            if (left == m || right == m) latestStep = i;
            
            groups[idx - left] = groups[idx + right] = left + right + 1;
        }
        
        return latestStep;
    }
}

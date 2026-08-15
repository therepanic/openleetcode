public class Solution {
    public long MaxProduct(string s) {
        int n = s.Length;
        
        // Manacher (odd length only)
        int[] d = new int[n];
        int l = 0;
        int r = -1;
        
        for (int i = 0; i < n; i++) {
            int k;
            if (i > r) {
                k = 1;
            } else {
                k = Math.Min(d[l + r - i], r - i + 1);
            }
            
            while (i - k >= 0 && i + k < n && s[i - k] == s[i + k]) {
                k++;
            }
            
            d[i] = k;
            
            if (i + k - 1 > r) {
                l = i - k + 1;
                r = i + k - 1;
            }
        }
        
        // left[i] = max palindrome ending at i
        int[] left = new int[n];
        
        for (int i = 0; i < n; i++) {
            int radius = d[i];
            int length = 2 * radius - 1;
            int end = i + radius - 1;
            left[end] = Math.Max(left[end], length);
        }
        
        // propagate backwards (reduce by 2)
        for (int i = n - 2; i >= 0; i--) {
            left[i] = Math.Max(left[i], left[i + 1] - 2);
        }
        
        // prefix max
        for (int i = 1; i < n; i++) {
            left[i] = Math.Max(left[i], left[i - 1]);
        }
        
        
        // right[i] = max palindrome starting at i
        int[] right = new int[n];
        
        for (int i = 0; i < n; i++) {
            int radius = d[i];
            int length = 2 * radius - 1;
            int start = i - radius + 1;
            right[start] = Math.Max(right[start], length);
        }
        
        // propagate forward (reduce by 2)
        for (int i = 1; i < n; i++) {
            right[i] = Math.Max(right[i], right[i - 1] - 2);
        }
        
        // suffix max
        for (int i = n - 2; i >= 0; i--) {
            right[i] = Math.Max(right[i], right[i + 1]);
        }
        
        
        // try all splits
        long ans = 0;
        for (int i = 0; i < n - 1; i++) {
            ans = Math.Max(ans, (long)left[i] * right[i + 1]);
        }
        
        return ans;
    }
}

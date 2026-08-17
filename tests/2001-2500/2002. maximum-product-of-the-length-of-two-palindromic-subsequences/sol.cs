public class Solution {
    public int MaxProduct(string s) {
        int n = s.Length;
        var palinMasks = new List<(int mask, int len)>();
        
        for (int mask = 1; mask < (1 << n); mask++) {
            var sb = new StringBuilder();
            for (int i = 0; i < n; i++) {
                if (((mask >> i) & 1) == 1) {
                    sb.Append(s[i]);
                }
            }
            string seq = sb.ToString();
            char[] arr = seq.ToCharArray();
            Array.Reverse(arr);
            string rev = new string(arr);
            if (seq == rev) {
                int count = 0;
                for (int i = 0; i < n; i++) {
                    if (((mask >> i) & 1) == 1) count++;
                }
                palinMasks.Add((mask, count));
            }
        }
        
        int maxProduct = 0;
        for (int i = 0; i < palinMasks.Count; i++) {
            for (int j = i + 1; j < palinMasks.Count; j++) {
                int m1 = palinMasks[i].mask;
                int m2 = palinMasks[j].mask;
                int l1 = palinMasks[i].len;
                int l2 = palinMasks[j].len;
                if ((m1 & m2) == 0) {
                    maxProduct = Math.Max(maxProduct, l1 * l2);
                }
            }
        }
        
        return maxProduct;
    }
}

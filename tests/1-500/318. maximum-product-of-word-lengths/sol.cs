public class Solution {
    public int MaxProduct(string[] words) {
        int n = words.Length;
        int[] bitmasks = new int[n];
        for (int i = 0; i < n; i++) {
            int mask = 0;
            foreach (char c in words[i]) {
                mask |= 1 << (c - 'a');
            }
            bitmasks[i] = mask;
        }
        int maxProd = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                if ((bitmasks[i] & bitmasks[j]) == 0) {
                    maxProd = Math.Max(maxProd, words[i].Length * words[j].Length);
                }
            }
        }
        return maxProd;
    }
}

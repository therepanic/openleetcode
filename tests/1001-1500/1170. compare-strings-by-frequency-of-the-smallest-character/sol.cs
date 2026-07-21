public class Solution {
    public int[] NumSmallerByFrequency(string[] queries, string[] words) {
        int F(string s) {
            char minChar = 'z';
            int count = 0;
            foreach (char c in s) {
                if (c < minChar) {
                    minChar = c;
                    count = 1;
                } else if (c == minChar) {
                    count++;
                }
            }
            return count;
        }
        
        int[] buckets = new int[12];
        foreach (string w in words) {
            buckets[F(w)]++;
        }
        for (int i = 9; i >= 0; i--) {
            buckets[i] += buckets[i + 1];
        }
        
        int[] result = new int[queries.Length];
        for (int i = 0; i < queries.Length; i++) {
            result[i] = buckets[F(queries[i]) + 1];
        }
        return result;
    }
}

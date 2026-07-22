class Solution {
    public int[] numSmallerByFrequency(String[] queries, String[] words) {
        int[] buckets = new int[12];
        for (String w : words) {
            buckets[f(w)]++;
        }
        for (int i = 9; i >= 0; i--) {
            buckets[i] += buckets[i + 1];
        }
        int[] result = new int[queries.length];
        for (int i = 0; i < queries.length; i++) {
            result[i] = buckets[f(queries[i]) + 1];
        }
        return result;
    }
    
    private int f(String s) {
        char minChar = 'z';
        int count = 0;
        for (char c : s.toCharArray()) {
            if (c < minChar) {
                minChar = c;
                count = 1;
            } else if (c == minChar) {
                count++;
            }
        }
        return count;
    }
}

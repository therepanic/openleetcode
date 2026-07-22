class Solution {
    public String longestPrefix(String s) {
        int n = s.length();
        int[] prefix = new int[n];
        int matched = 0;
        for (int i = 1; i < n; i++) {
            while (matched > 0 && s.charAt(i) != s.charAt(matched)) {
                matched = prefix[matched - 1];
            }
            if (s.charAt(i) == s.charAt(matched)) {
                matched++;
            }
            prefix[i] = matched;
        }
        return s.substring(0, prefix[n - 1]);
    }
}

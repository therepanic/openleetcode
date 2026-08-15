class Solution {
    public int countPalindromicSubsequence(String s) {
        int n = s.length();
        int[] first = new int[26];
        int[] last = new int[26];
        for (int i = 0; i < 26; i++) {
            first[i] = -1;
            last[i] = -1;
        }

        for (int i = 0; i < n; i++) {
            int c = s.charAt(i) - 'a';
            if (first[c] == -1) first[c] = i;
            last[c] = i;
        }

        int ans = 0;
        for (int c = 0; c < 26; c++) {
            if (first[c] != -1 && last[c] - first[c] > 1) {
                int mask = 0;
                for (int i = first[c] + 1; i < last[c]; i++) {
                    mask |= 1 << (s.charAt(i) - 'a');
                }
                ans += Integer.bitCount(mask);
            }
        }
        return ans;
    }
}

class Solution {
    public int findSubstringInWraproundString(String s) {
        int[] counts = new int[26];
        int maxLen = 0;
        int sum = 0;

        for (int i = 0; i < s.length(); i++) {
            if (i > 0 && (s.charAt(i) - s.charAt(i - 1) + 26) % 26 == 1) {
                maxLen++;
            } else {
                maxLen = 1;
            }
            int idx = s.charAt(i) - 'a';
            counts[idx] = Math.max(counts[idx], maxLen);
        }

        for (int count : counts) {
            sum += count;
        }

        return sum;
    }
}

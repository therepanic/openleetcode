public class Solution {
    public int FindSubstringInWraproundString(string s) {
        int[] counts = new int[26];
        int maxLen = 0;

        for (int i = 0; i < s.Length; i++) {
            if (i > 0 && (s[i] - s[i-1] + 26) % 26 == 1) {
                maxLen++;
            } else {
                maxLen = 1;
            }
            int idx = s[i] - 'a';
            if (counts[idx] < maxLen) {
                counts[idx] = maxLen;
            }
        }

        int sum = 0;
        foreach (int count in counts) {
            sum += count;
        }

        return sum;
    }
}

public class Solution {
    public bool CanConstruct(string s, int k) {
        if (s.Length < k) {
            return false;
        }

        int[] charCount = new int[26];
        foreach (char c in s) {
            charCount[c - 'a']++;
        }

        int oddCount = 0;
        foreach (int freq in charCount) {
            if (freq % 2 != 0) {
                oddCount++;
            }
        }

        return oddCount <= k;
    }
}

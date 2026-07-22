class Solution {
    public boolean canConstruct(String s, int k) {
        if (s.length() < k) {
            return false;
        }

        int[] charCount = new int[26];
        for (char c : s.toCharArray()) {
            charCount[c - 'a']++;
        }

        int oddCount = 0;
        for (int freq : charCount) {
            if (freq % 2 != 0) {
                oddCount++;
            }
        }

        return oddCount <= k;
    }
}

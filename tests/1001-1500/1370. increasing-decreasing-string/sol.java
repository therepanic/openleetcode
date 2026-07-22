class Solution {
    public String sortString(String s) {
        if (s.isEmpty()) return "";
        int[] counts = new int[26];
        for (char c : s.toCharArray()) {
            counts[c - 'a']++;
        }
        StringBuilder ans = new StringBuilder();
        boolean added;
        do {
            added = false;
            for (int i = 0; i < 26; i++) {
                if (counts[i] > 0) {
                    ans.append((char) ('a' + i));
                    counts[i]--;
                    added = true;
                }
            }
            for (int i = 25; i >= 0; i--) {
                if (counts[i] > 0) {
                    ans.append((char) ('a' + i));
                    counts[i]--;
                    added = true;
                }
            }
        } while (added);
        return ans.toString();
    }
}

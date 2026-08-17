class Solution {
    public boolean canConvertString(String s, String t, int k) {
        if (s.length() != t.length()) return false;
        int[] shiftCount = new int[26];
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == t.charAt(i)) continue;
            int diff = (t.charAt(i) - s.charAt(i) + 26) % 26;
            shiftCount[diff]++;
            if (diff + 26 * (shiftCount[diff] - 1) > k) return false;
        }
        return true;
    }
}

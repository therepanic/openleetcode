class Solution {
    public int findLUSlength(String[] strs) {
        Arrays.sort(strs, (a, b) -> Integer.compare(b.length(), a.length()));

        for (int i = 0; i < strs.length; i++) {
            boolean isUnique = true;
            for (int j = 0; j < strs.length; j++) {
                if (i == j) continue;
                if (isSubsequence(strs[i], strs[j])) {
                    isUnique = false;
                    break;
                }
            }
            if (isUnique) return strs[i].length();
        }

        return -1;
    }

    private boolean isSubsequence(String s, String t) {
        int i = 0;
        for (int j = 0; j < t.length() && i < s.length(); j++) {
            if (s.charAt(i) == t.charAt(j)) i++;
        }
        return i == s.length();
    }
}

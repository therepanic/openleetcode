class Solution {
    public String mergeAlternately(String word1, String word2) {
        StringBuilder merged = new StringBuilder();
        int minLen = Math.min(word1.length(), word2.length());
        for (int i = 0; i < minLen; i++) {
            merged.append(word1.charAt(i)).append(word2.charAt(i));
        }
        if (word1.length() > minLen) {
            merged.append(word1.substring(minLen));
        }
        if (word2.length() > minLen) {
            merged.append(word2.substring(minLen));
        }
        return merged.toString();
    }
}

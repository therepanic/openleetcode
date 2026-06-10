class Solution {
    public boolean wordBreak(String s, String[] wordDict) {
        java.util.Set<String> words = new java.util.HashSet<>(java.util.Arrays.asList(wordDict));
        int maxLen = 0;
        for (String word : wordDict) maxLen = Math.max(maxLen, word.length());
        boolean[] dp = new boolean[s.length() + 1];
        dp[s.length()] = true;
        for (int i = s.length() - 1; i >= 0; i--) {
            for (int len = 1; len <= maxLen && i + len <= s.length(); len++) {
                if (words.contains(s.substring(i, i + len)) && dp[i + len]) {
                    dp[i] = true;
                    break;
                }
            }
        }
        return dp[0];
    }
}

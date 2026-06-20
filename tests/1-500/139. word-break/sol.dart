class Solution {
  bool wordBreak(String s, List<String> wordDict) {
    final words = wordDict.toSet();
    var maxLen = 0;
    for (final word in wordDict) if (word.length > maxLen) maxLen = word.length;
    final dp = List.filled(s.length + 1, false);
    dp[s.length] = true;
    for (var i = s.length - 1; i >= 0; i--) {
      for (var len = 1; len <= maxLen && i + len <= s.length; len++) {
        if (words.contains(s.substring(i, i + len)) && dp[i + len]) { dp[i] = true; break; }
      }
    }
    return dp[0];
  }
}

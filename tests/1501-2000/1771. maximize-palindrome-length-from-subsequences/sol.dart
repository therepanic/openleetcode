class Solution {
  int longestPalindrome(String word1, String word2) {
    String word = word1 + word2;
    int n = word.length;
    List<List<int>> memo = List.generate(n, (_) => List.filled(n, -1));
    
    int fn(int lo, int hi) {
      if (lo >= hi) return lo == hi ? 1 : 0;
      if (memo[lo][hi] != -1) return memo[lo][hi];
      if (word[lo] == word[hi]) {
        memo[lo][hi] = 2 + fn(lo+1, hi-1);
      } else {
        memo[lo][hi] = max(fn(lo+1, hi), fn(lo, hi-1));
      }
      return memo[lo][hi];
    }
    
    int ans = 0;
    Set<String> seen = {};
    for (int i = 0; i < word1.length; i++) {
      String c = word1[i];
      if (seen.contains(c)) continue;
      seen.add(c);
      int idx1 = word1.indexOf(c);
      int idx2 = word2.lastIndexOf(c);
      if (idx1 != -1 && idx2 != -1) {
        ans = max(ans, fn(idx1, idx2 + word1.length));
      }
    }
    return ans;
  }
}
